<?php

/**
 * @TODO LICENCE
 */

namespace sn\oxidflaechenberechnung\Controller\Admin;

use oxRegistry;
use oxDb;
use oxField;
use stdClass;
use Exception;

/**
 * Class LinslinSliderMain.
 */
class MainController extends \OxidEsales\Eshop\Application\Controller\Admin\AdminDetailsController {

    protected $_oArticle = null;
    protected $_sThisTemplate = 'flaechenberechnungadmin.tpl';

    public function __construct() { 
		//var_dump($this->_sThisTemplate);
    }

    public function getDB() {
	return \OxidEsales\Eshop\Core\DatabaseProvider::getDb(\OxidEsales\Eshop\Core\DatabaseProvider::FETCH_MODE_ASSOC);
    }

    public function render() {

	try {

	    $myConfig = $this->getConfig();

	    parent::render();

	    $this->_aViewData["edit"] = $oArticle = oxNew(\OxidEsales\Eshop\Application\Model\Article::class);
	    ;

	    $soxId = $this->getEditObjectId();

	    if ($soxId != "-1" && isset($soxId)) {


		// load object
		$oArticle->loadInLang($this->_iEditLang, $soxId);
		// load object in other languages
		$oOtherLang = $oArticle->getAvailableInLangs();
		if (!isset($oOtherLang[$this->_iEditLang])) {
		    // echo "language entry doesn't exist! using: ".key($oOtherLang);
		    $oArticle->loadInLang(key($oOtherLang), $soxId);
		}

		foreach ($oOtherLang as $id => $language) {
		    $oLang = new stdClass();

		    $oLang->sLangDesc = $language;
		    $oLang->selected = ($id == $this->_iEditLang);
		    $this->_aViewData["otherlang"][$id] = clone $oLang;
		}


		// variant handling
		if ($oArticle->oxarticles__oxparentid->value) {
		    $oParentArticle = oxNew(\OxidEsales\Eshop\Application\Model\Article::class);
		    ;
		    $oParentArticle->load($oArticle->oxarticles__oxparentid->value);
		    $this->_aViewData["parentarticle"] = $oParentArticle;
		    $this->_aViewData["oxparentid"] = $oArticle->oxarticles__oxparentid->value;
		}

		if ($myConfig->getConfigParam('blMallInterchangeArticles')) {
		    $sShopSelect = '1';
		} else {
		    $sShopID = $myConfig->getShopID();
		    $sShopSelect = " oxshopid =  '$sShopID' ";
		}
	    }

	} catch (Exception $exception) {
	    throw $exception;
	}
	return $this->_sThisTemplate;
    }

    public function getUID() {
	return \OxidEsales\Eshop\Core\Registry::getUtilsObject()->generateUID();
    }



    public function save() {
	parent::save();

	$soxId = $this->getEditObjectId();
	$aParams = \OxidEsales\Eshop\Core\Registry::getConfig()->getRequestParameter("editval");

	if (!isset($aParams['oxarticles__flaeche_aktiv'])) {

	    $aParams['oxarticles__flaeche_aktiv'] = '';
	}

	$oArticle = $this->_aViewData['edit'];	
	$myConfig = $this->getConfig();
	
	
	//$sShopID = oxSession::getVar("actshop");
	$sShopID = $myConfig->getShopID();
	
	$aParams['oxarticles__oxshopid'] = $sShopID;

	$oArticle = oxNew(\OxidEsales\Eshop\Application\Model\Article::class);
	
	$oArticle->loadInLang($this->_iEditLang, $soxId);

	$oArticle->setLanguage(0);

// checkbox handling
	if (!$oArticle->oxarticles__oxparentid->value && !isset($aParams['oxarticles__oxremindactive'])) {
	    $aParams['oxarticles__oxremindactive'] = 0;
	}

	$oArticle->assign($aParams);

//tells to article to save in different language
	$oArticle->setLanguage($this->_iEditLang);
	$oArticle = oxRegistry::get("oxUtilsFile")->processFiles($oArticle);

	$oArticle->resetRemindStatus();

	$oArticle->updateVariantsRemind();

	$oArticle->save();
    }
}
