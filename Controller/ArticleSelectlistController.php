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

class ArticleSelectlistController extends \OxidEsales\Eshop\Application\Controller\FrontendController
{
    /**
     * Current class default template name.
     *
     * @var string
     */
    protected $_sThisTemplate = 'ajax/snAjaxSelectlist.tpl';
    
        public function render()
    {
	    
	    parent::render();
	    return $this->_sThisTemplate;

                
        
    }
}