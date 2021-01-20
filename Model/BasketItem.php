<?php

namespace sn\oxidflaechenberechnung\Model;

class BasketItem extends BasketItem_parent {

    public function getMaterialWeight() {
	return $this->_oArticle->getGewicht();
    }

    public function setBasketItemId($id) {
	$this->basketItemId = $id;
    }

    public function getBasketItemId() {
	if (isset($this->basketItemId)) {
	    return $this->basketItemId;
	} else {
	    return '0';
	}
    }

    public function calcWeight($amount = 0) {
	$aPersParams = $this->getPersParams();
	if ($aPersParams['flaeche_aktiv'] == 1) {
	    $oArticle = $this->getArticle(true);
	    $m2weight = $oArticle->getGewicht();
	    $newWeight = ((( $aPersParams['hoehe'] * $aPersParams['breite'] ) * $m2weight ) / 1000) * $amount;
	    $this->_dWeight = $newWeight;
	    $oArticle->oxarticles__oxweight->value = $newWeight;

	    return $newWeight;
	}
    }

    public function calcAPrice($params = null) {

	if ($params) {
	    $aPersParams = $params;
	} else {
	    $aPersParams = $this->getPersParams();
	}

	$oArticle = $this->getArticle(true);
	$aSelections = $oArticle->getSelections();
	$selectionsList = array();
	foreach ($aSelections AS $sKey => $sel) {
	    $selectionsList[] = \OxidEsales\Eshop\Core\Registry::getUtils()->assignValuesFromText($sel->oxselectlist__oxvaldesc->getRawValue(), $sel->getVat());
	}

	$dVat = 0;
	$dVatMulti = 0;
	if (($oPrice = $oArticle->getPrice()) != null) {
	    $dVat = $oPrice->getVat();
	    $dVatMulti = 1 + ($dVat / 100);
	}
	//var_dump($selectionsList);
	//var_dump($this->_aSelList);
	
	$percentAdd = 0;
	$add2Price = 0;
	foreach ($this->_aSelList AS $selValKey => $selValRaw) {
	    $selObj = $selectionsList[$selValKey][$selValRaw];

	    if ($selObj->priceUnit == "abs") {
		$add2Price = $add2Price + round($selObj->price * $dVatMulti, 2);
	    }
	    if ($selObj->priceUnit == "%") {
		$percentAdd = $percentAdd + $selObj->price;
	    }
	}

	//var_dump($percentAdd);
	//var_dump($add2Price);


	$session = \OxidEsales\Eshop\Core\Registry::getSession();

	$sparams = $session->getVariable($this->getBasketItemId());

	$oArticle = $this->getArticle(true);
	//var_dump(  $oArticle->getSelections() );
	//  var_dump($aPersParams);
	//  var_dump($oArticle->isFlaechenberechnungActive());
	if ($oArticle->isFlaechenberechnungActive() == 1) {
	    //if (isset($aPersParams['flaeche_aktiv']) && $aPersParams['flaeche_aktiv'] == 1) { 

	    if (!isset($aPersParams['breite'])) {
		$aPersParams['breite'] = $oArticle->getMinB();
	    }

	    if (!isset($aPersParams['hoehe'])) {
		$aPersParams['hoehe'] = $oArticle->getMinH();
	    }

	    $breite = $aPersParams['breite'];
	    $hoehe = $aPersParams['hoehe'];
	    $preisObj = $oArticle->getPrice();
	    $preis = $preisObj->getPrice();
	    $newPrice = $this->getFlaeche($aPersParams) * $preis;
	    
	    $newPrice = $newPrice * (1+($percentAdd/100));
	    $newPrice = $newPrice + $add2Price;
	    
	    return $newPrice;
	} else {
	    return $this->_oPrice;
	}
    }

    public function getFlaeche($aParams) {
	//var_dump($aParams);
	$hoehe = str_replace(',', '.', $aParams['hoehe']);
	$breite = str_replace(',', '.', $aParams['breite']);

	return (float) $hoehe * (float) $breite;
    }

    public function setPrice($oPrice, $params = null) {

	$oArticle = $this->getArticle(true);

	$aPersParams = $this->getPersParams();


	//if ($params !== null || $aPersParams['flaeche_aktiv'] == '1') {
	if ($params !== null || $oArticle->isFlaechenberechnungActive() == 1) {
	    $newPrice = $this->calcAPrice($params);

	    $this->_dNetto = $newPrice;
	    $this->_dBrutto = $newPrice;
	    $oPrice->setPrice($newPrice);

	    $this->_oUnitPrice = clone $oPrice;
	    if ($aPersParams['flaeche_aktiv'] == '1') {
		
	    }
	    $this->_oRegularUnitPrice = clone $oPrice;


	    $this->_oPrice = clone $oPrice;
	    $this->_oPrice->multiply($this->getAmount());
	} else {
	    $this->_oUnitPrice = clone $oPrice;
	    $this->_oPrice = clone $oPrice;
	    $this->_oPrice->multiply($this->getAmount());
	}
    }

    public function getRegularUnitPrice() {
	//$aPersParams = $this->getPersParams();
	//if ($aPersParam['flaeche_aktiv'] == '1') {
	$oArticle = $this->getArticle(true);
	if ($oArticle->isFlaechenberechnungActive()) {
	    return $this->_oPrice;
	} else {
	    return $this->_oRegularUnitPrice;
	}
    }

}
