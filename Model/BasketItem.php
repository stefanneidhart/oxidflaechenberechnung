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
	    $this->_dWeight = $newWeight ;
	    $oArticle->oxarticles__oxweight->value = $newWeight;
	}
    }

    public function calcAPrice($params = null) {

	if ($params) {
	    $aPersParams = $params;
	} else {
	    $aPersParams = $this->getPersParams();
	}

	if (isset($aPersParams['flaeche_aktiv']) && $aPersParams['flaeche_aktiv'] == 1) {

	    $this->flaeche_aktiv_flag = true;
	    $oArticle = $this->getArticle(true);

	    $breite = $aPersParams['breite'];
	    $hoehe = $aPersParams['hoehe'];
	    $preisObj = $oArticle->getPrice();
	    $preis = $preisObj->getPrice();
	    $newPrice = ($breite * $hoehe) * $preis;
	    	    
	    return $newPrice;
	} else {
	    return $this->_oPrice;
	}
    }

    public function setPrice($oPrice, $params = null) {

	$aPersParams = $this->getPersParams();

	
	if ($params !== null || $aPersParams['flaeche_aktiv'] == '1') {
	    $newPrice = $this->calcAPrice($params);

	    $this->_dNetto = $newPrice;
	    $this->_dBrutto = $newPrice;
	    $oPrice->setPrice($newPrice);

	    $this->_oUnitPrice = clone $oPrice;
	    if ($aPersParams['flaeche_aktiv'] == '1') {
		$this->_oRegularUnitPrice = clone $oPrice;
	    }

	    $this->_oPrice = clone $oPrice;
	    $this->_oPrice->multiply($this->getAmount());
	} else {
	    $this->_oUnitPrice = clone $oPrice;
	    $this->_oPrice = clone $oPrice;
	    $this->_oPrice->multiply($this->getAmount());
	}
    }

    public function getRegularUnitPrice() {
	$aPersParams = $this->getPersParams();
	if ($aPersParam['flaeche_aktiv'] == '1') {
	    return $this->_oPrice;
	} else {
	    return $this->_oRegularUnitPrice;
	}
    }
}