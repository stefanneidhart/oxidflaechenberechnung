<?php

namespace sn\oxidflaechenberechnung\Model;

class OrderArticle extends OrderArticle_parent {

    public function getMaterialWeight($materialid) {
	return $this->_oArticle->getGewicht();
    }

}
