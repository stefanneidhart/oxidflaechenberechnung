<?php

namespace sn\oxidflaechenberechnung\Model;

class Article extends Article_parent {

    public function getMaxH() {
	return $this->oxarticles__flaeche_hoehe_max->value;
    }

    public function getMaxB() {
	return $this->oxarticles__flaeche_breite_max->value;
    }

    public function getMinH() {
	return $this->oxarticles__flaeche_hoehe_min->value;
    }

    public function getMinB() {
	return $this->oxarticles__flaeche_breite_min->value;
    }

    public function getGewicht() {
	return $this->oxarticles__flaeche_gewicht->value;
    }

    public function getBLabel() {
	$label = $this->oxarticles__flaeche_breite_label->value;
	if (!empty($label)) {
	    return 'Breite';
	} else {
	    return $label;
	}
    }

    public function getHLabel() {
	$label = $this->oxarticles__flaeche_hoehe_label->value;
	if (!empty($label)) {
	    return 'Höhe';
	} else {
	    return $label;
	}
    }

}
