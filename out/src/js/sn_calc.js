var CalcHandler = function ()
{
    this.gewicht = 0;
    this.maxH = 0;
    this.maxB = 0;
    this.minH = 1;
    this.minB = 1;
    this.preis = 0;

    this.init = function ()
    {
	var myself = this;

	$('#hoehe, #breite').change(function () {
	    myself.setMin();
	    myself.setMax();
	    myself.calcArea();
	    myself.calcPrice();
	});

	$('#hoehe').change();

    }

    this.calcArea = function ()
    {
	var hoehe = this.getHeight();
	var breite = this.getWidth();

	var result = hoehe * breite;
	$('#AreaResult').html(result.toFixed(2) + ' m²');
	this.calcWeight(result);
    }

    this.setMin = function () {
	if (this.getHeight() < this.minH) {
	    $('#hoehe').val(Number(this.minH));
	}

	if (this.getWidth() < this.minB) {
	    $('#breite').val(Number(this.minB));
	}
    }

    this.setMax = function () {
	if (this.getHeight() > Number(this.maxH)) {
	    $('#hoehe').val(Number(this.maxH));
	}
	if (this.getWidth() > Number(this.maxB)) {
	    $('#breite').val(Number(this.maxB));
	}
    }

    this.calcWeight = function (area) {
	var weight = (area * this.gewicht) / 1000;
	$('.weight').html('Gewicht: ' + weight.toFixed(2) + ' kg');
    }

    this.getHeight = function () {
	var tempHeight = $('#hoehe').val();
	tempHeight = tempHeight.replace(",", ".");
	return parseFloat(tempHeight);
    }

    this.getWidth = function () {
	var tempWidth = $('#breite').val();
	tempWidth = tempWidth.replace(",", ".");
	return parseFloat(tempWidth);
    }

    this.setPrice = function (price) {
	$('#productPrice').html('<span><span class="price-from"></span><span class="price">' + price.toFixed(2) + ' €</span><span class="price-markup">*</span><span class="d-none"> <span itemprop="price">' + price + ' €</span></span></span>');
    }

    this.setUnitPrice = function (price) {
	$('#productPriceUnit').html(price.toFixed(2) + ' € je m²');
    }

    this.calcPrice = function ()
    {
	var myself = this;
	var hoehe = this.getHeight();
	var breite = this.getWidth();
	var newPrice = (breite * hoehe) * this.preis;

	this.setPrice(newPrice);
	this.setUnitPrice(newPrice / (breite * hoehe));
    }

    this.setMaxH = function (option) {
	this.maxH = option;
    }

    this.setMaxB = function (option) {
	this.maxB = option;
    }

    this.setMinH = function (option) {
	this.minH = option;
    }

    this.setMinB = function (option) {
	this.minB = option;
    }

    this.setMaxGewicht = function (option) {
	this.gewicht = option;
    }

    this.setPreis = function (option) {
	this.preis = option;
    }
};

$(document).ready(function ()
{
    var CH = new CalcHandler();

    CH.setMaxH(MaxH);
    CH.setMaxB(MaxB);

    CH.setMinH(MinH);
    CH.setMinB(MinB);

    CH.setMaxGewicht(Gewicht);
    CH.setPreis(Preis);

    CH.init();
});
