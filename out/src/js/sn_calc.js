var CalcHandler = function ()
{
    this.gewicht = 0;
    this.maxH = 0;
    this.maxB = 0;
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
	$('#AreaResult').html(result + ' m²');
	this.calcWeight(result);
    }

    this.setMin = function () {
	if (this.getHeight() < 1) {
	    $('#hoehe').val(Number(1));
	}

	if (this.getWidth() < 1) {
	    $('#breite').val(Number(1));
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
	$('.weight').html('Gewicht: ' + weight + ' kg');
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
	CH.setMaxGewicht(Gewicht);
	CH.setPreis(Preis);
	
	CH.init();
    });
