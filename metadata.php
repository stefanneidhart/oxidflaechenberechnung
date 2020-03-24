<?php

/**
 * @TODO LICENCE HERE
 */
/**
 * Metadata version
 */
$sMetadataVersion = '2.0';

/**
 * Module information
 */
$aModule = array(
	'id' => 'oxidflaechenberechnung',
	'title' => array(
		'de' => 'OXID6 Flächenberechung mit Staffelpreis',
		'en' => 'OXID6 Flächenberechung mit Staffelpreis',
	),
	'description' => array(
		'de' => '<h2>OXID6 Flächenberechung mit Staffelpreis</h2>',
		'en' => '<h2>OXID6 Flächenberechung mit Staffelpreis</h2>',
	),
	'thumbnail' => 'calc.png',
	'version' => '1.0.0',
	'author' => 'Stefan Neidhart',
	'url' => 'https://www.stefanneidhart.de',
	'email' => 'info@stefanneidhart.de',
	'extend' => array(
		//\OxidEsales\Eshop\Core\ViewConfig::class => \sn\oxidflaechenberechnung\Core\ViewConfig::class,
		\OxidEsales\Eshop\Application\Model\Article::class => \sn\oxidflaechenberechnung\Model\Article::class,
		\OxidEsales\Eshop\Application\Model\Basket::class => \sn\oxidflaechenberechnung\Model\Basket::class,
		\OxidEsales\Eshop\Application\Model\BasketItem::class => \sn\oxidflaechenberechnung\Model\BasketItem::class,
		//\OxidEsales\Eshop\Application\Model\OrderArticle::class => \sn\oxidflaechenberechnung\Model\OrderArticle::class,
	),
	'controllers' => array(
		'maincontrollerflaechenberechnung' => \sn\oxidflaechenberechnung\Controller\Admin\MainController::class,
	),
	'files' => array(),
	'templates' => array(
		'flaechenberechnungadmin.tpl' => 'sn/oxidflaechenberechnung/views/admin/articlecalcsn.tpl',
		//'ajaxareacalc.tpl' => 'oxid6-areacalc-module/out/tpl/page/details/inc/ajaxareacalc.tpl',
	),
	'blocks' => array(
		array(
			'template' => 'page/details/inc/productmain.tpl',
			'block' => 'details_productmain_shortdesc',
			'file' => 'views/blocks/page/details/inc/details_productmain_flaechenberechnung.tpl'
		),
		array(
			'template' => 'page/checkout/inc/basketcontents_list.tpl',
			'block' => 'checkout_basketcontents_basketitem_persparams',
			'file' => 'views/blocks/page/checkout/inc/checkout_basketcontents_basketitem_titlenumber.tpl'
		),
		/*array(
			'template' => 'page/account/order.tpl',
			'block' => 'account_order_history',
			'file' => 'views/blocks/account/account_order_history.tpl'
		),
		array(
			'template' => 'email/html/order_owner.tpl',
			'block' => 'email_html_order_owner_basketitem',
			'file' => 'views/blocks/email/html/email_html_order_owner_basketitem.tpl'
		),
		array(
			'template' => 'email/plain/order_owner.tpl',
			'block' => 'email_plain_order_ownerbasketitem',
			'file' => 'views/blocks/email/plain/email_plain_order_ownerbasketitem.tpl'
		),
		array(
			'template' => 'email/html/order_cust.tpl',
			'block' => 'email_html_order_cust_basketitem',
			'file' => 'views/blocks/email/html/email_html_order_cust_basketitem.tpl'
		),
		array(
			'template' => 'email/plain/order_cust.tpl',
			'block' => 'email_plain_order_cust_basketitem',
			'file' => 'views/blocks/email/plain/email_plain_order_cust_basketitem.tpl'
		),*/
	),
);