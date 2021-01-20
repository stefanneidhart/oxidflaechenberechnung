<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ArticleSelectlistController
 *
 * @author Neidini
 */

namespace sn\oxidflaechenberechnung\Controller;

class ArticleSelectlistController extends \OxidEsales\Eshop\Application\Controller\FrontendController {

    /**
     * Current class default template name.
     *
     * @var string
     */
    protected $_sThisTemplate = 'snAjaxSelectlist.tpl';

    public function renderSN() {

	try {

	    $config = $this->getConfig();
	    parent::render();
	    
	    
	    $this->_snPrice = 55;
	    
	} catch (Exception $exception) {
	    throw $exception;
	}

	return $this->_sThisTemplate;
    }

    public function getNewPrice() {
	return 10;
    }
    
    
}
