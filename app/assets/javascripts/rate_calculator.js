function RateCalculator(target) {
  this.$target = $(target);
  this.$rate = this.$target.find(".calc-rate");
  this.$positions = this.$target.find(".calc-positions");
  this.$days = this.$target.find(".calc-days");
  this.$total = this.$target.find(".calc-total");
}

RateCalculator.prototype.init = function() {
  var inputs = this.$target.find(".calc-input");
  inputs.keyup(this.update.bind(this));
}

RateCalculator.prototype.update = function() {
  var rate = parseInt(this.$rate.first().val());
  var positions = parseInt( this.$positions.val() );
  var days = parseInt( this.$days.val() );
  if(rate > 0 && positions > 0 && days > 0) {
    var newTotal = rate * positions * days;
    this.$total.val("$" + newTotal + ".00");
  }
}

new RateCalculator("#rate-calculator").init();
