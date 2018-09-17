within GenKinetics.Interfaces;

package Reversible
  extends Modelica.Icons.BasesPackage;

  model ReactionReversibility "Base Type for describing Reversability of a reaction"
    parameter Units.ReactionCoef Vfwdmax = 1 "maximal forward reaction rate";
  end ReactionReversibility;


  model OneWay "Irreversible Reaction"
    extends ReactionReversibility;
    annotation(
      Icon(graphics = {Bitmap(extent = {{-78, 80}, {86, -80}}, fileName = "../../icons/OneWay.gif")}));
  end OneWay;



  partial model TwoWay "Reversible Reaction"
    extends ReactionReversibility;
    parameter Units.ReactionCoef Vbwdmax = 1 "backward maximal reaction rate";
    annotation(
      Icon(graphics = {Bitmap(extent = {{-110, 100}, {90, -100}}, fileName = "../../icons/TwoWay.gif")}));
  end TwoWay;




end Reversible;
