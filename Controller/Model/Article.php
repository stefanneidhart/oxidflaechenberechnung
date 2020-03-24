<?php

namespace sn\oxidflaechenberechnung\Model;

class Article extends Article_parent {

    public function getMaxH() {
	return $this->oxarticles__flaeche_hoehe_max->value;
    }

    public function getMaxB() {
	return $this->oxarticles__flaeche_breite_max->value;
    }

    public function getGewicht() {
	return $this->oxarticles__flaeche_gewicht->value;
    }

}
