<style>
@CHARSET "ISO-8859-1";
@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

fieldset, label { margin: 0; padding: 0; }
body{ margin: 20px; }
h1 { font-size: 1.5em; margin:0px; }

/****** Style Star rating1 Widget *****/

.rating1 { 
  border: 1px solid black;
  float: left;
  background-color:#8261D3;
}

.rating1 > input { display: none; } 
.rating1 > label:before { 
  margin: 5px;
  font-size: 1.50em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating1 > .half:before { 
  content: "\f089";
  position: absolute;
}

.rating1 > label { 
  color: #fff; 
 float: right; 
}

/***** CSS Magic to Highlight Stars on Hover *****/

.rating1 > input:checked ~ label, /* show gold star when clicked */
.rating1:not(:checked) > label:hover, /* hover current star */
.rating1:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating1 > input:checked + label:hover, /* hover current star when changing rating1 */
.rating1 > input:checked ~ label:hover,
.rating1 > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating1 > input:checked ~ label:hover ~ label { color: #FFED85;  } 

</style>
<link href="css/starcss.css" rel="stylesheet" type="text/css" media="all" /> 
<h1>Rate For Products</h1>
<fieldset class="rating1">
    <input type="radio" id="star5" name="rating1" value="5" onclick="rate(this.value)"/><label class = "full" for="star5" title="Awesome - 5 stars"></label>
    <input type="radio" id="star4half" name="rating1" value="4.5" onclick="rate(this.value)"/><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
    <input type="radio" id="star4" name="rating1" value="4" onclick="rate(this.value)"/><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
    <input type="radio" id="star3half" name="rating1" value="3.5" onclick="rate(this.value)"/><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
    <input type="radio" id="star3" name="rating1" value="3" onclick="rate(this.value)"/><label class = "full" for="star3" title="Meh - 3 stars"></label>
    <input type="radio" id="star2half" name="rating1" value="2.5" onclick="rate(this.value)"/><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
    <input type="radio" id="star2" name="rating1" value="2" onclick="rate(this.value)"/><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
    <input type="radio" id="star1half" name="rating1" value="1.5" onclick="rate(this.value)"/><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
    <input type="radio" id="star1" name="rating1" value="1" onclick="rate(this.value)"/><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
    <input type="radio" id="starhalf" name="rating1" value="0.5" onclick="rate(this.value)"/><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
</fieldset>