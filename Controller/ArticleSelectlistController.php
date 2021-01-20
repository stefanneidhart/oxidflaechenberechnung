<?php

namespace sn\oxidflaechenberechnung\Controller;

use stdClass;
use Exception;

class ArticleSelectlistController extends \OxidEsales\Eshop\Application\Controller\FrontendController {

    protected $_sThisTemplate = 'snAjaxSelectlist.tpl';

    public function renderSN() {

	try {

	    $config = $this->getConfig();
	    $this->_snaid = \OxidEsales\Eshop\Core\Registry::getConfig()->getRequestParameter("snaid");
	    $article = oxNew(\OxidEsales\Eshop\Application\Model\Article::class);
	    if (($article->load($this->_snaid))) {
		
		$add2Price = 0;
		
		$aSelections = $article->getSelections();

		$selectionsList = array();
		foreach ($aSelections AS $sKey => $sel) {

		    $selectionsList[] = \OxidEsales\Eshop\Core\Registry::getUtils()->assignValuesFromText($sel->oxselectlist__oxvaldesc->getRawValue(), $sel->getVat());
		}
		
            $dVat = 0;
	    $dVatMulti = 0;
            if (($oPrice = $article->getPrice()) != null) {
                $dVat = $oPrice->getVat();
		$dVatMulti = 1+($dVat/100);
            }
		

		$seldata = \OxidEsales\Eshop\Core\Registry::getConfig()->getRequestParameter("selval");
		$selectionsData = explode(";", $seldata);
		$skeys = array();
		$percentAdd = 0;
		
		foreach ($selectionsData AS $selValKey => $selValRaw) {
		    $selDataSplit = explode(":", $selValRaw);
		    if (count($selDataSplit) == 2) {

			$selValue = $selDataSplit[1];
			$selKey = substr($selDataSplit[0], -2, 1);
			$skeys[] = $selectionsList[$selKey];
			
			$selObj = $selectionsList[$selKey][$selValue];
			
			if($selObj->priceUnit == "abs") {
			    $add2Price = $add2Price + round($selObj->price*$dVatMulti , 2);
			}
			if($selObj->priceUnit == "%") {
			    $percentAdd = $percentAdd + $selObj->price;
			}			
		    }
		}

		$this->_snSelList = $skeys;
		
		$aPersParams['hoehe'] = \OxidEsales\Eshop\Core\Registry::getConfig()->getRequestParameter("h");
		$aPersParams['breite'] = \OxidEsales\Eshop\Core\Registry::getConfig()->getRequestParameter("b");		

		$this->_snPrice = $this->calcAPrice($article, $aPersParams, $add2Price, $percentAdd);
	    } else {
		$this->_snPrice = 0;
	    }
	} catch (Exception $exception) {
	    throw $exception;
	}
    }

    public function getNewPrice() {
	return 10;
    }

    
    public function calcAPrice($oArticle, $aPersParams, $add2Price, $percentAdd) {
	
	if ($oArticle->isFlaechenberechnungActive() == 1) {
	        
	    if (!isset($aPersParams['breite'])) {
		$aPersParams['breite']= $oArticle->getMinB();
	    }
	    
	    if (!isset($aPersParams['hoehe'])) {
		$aPersParams['hoehe']= $oArticle->getMinH();
	    }	    
	    
	    $breite = $aPersParams['breite'];
	    $hoehe = $aPersParams['hoehe'];
	    $preisObj = $oArticle->getPrice();
	    $preis = $preisObj->getPrice();
	    $newPrice = $this->getFlaeche($aPersParams) * $preis;

	    $newPrice = $newPrice * (1+($percentAdd/100));	    
	    
	    return $newPrice + $add2Price;
	} else {
	    return $this->_oPrice;
	}
    }    
    
        public function getFlaeche($aParams) {
	//var_dump($aParams);
	$hoehe = str_replace(',', '.', $aParams['hoehe']);
	$breite = str_replace(',', '.', $aParams['breite']);
	
	return (float)$hoehe * (float)$breite;
    }
    
}
