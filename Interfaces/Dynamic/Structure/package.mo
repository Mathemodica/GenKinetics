within GenKinetics.Interfaces.Dynamic;
package Structure
  extends Modelica.Icons.BasesPackage;

  partial model ReactionStructure "The structure of a reaction reversibility, molecularity and order"

    replaceable class Reversibility = Reversible.OneWay constrainedby
    Reversible.ReactionReversibility;
    extends Reversibility;

    replaceable class Dimensionality = Dynamic.Dimension.UniUni constrainedby
    Dynamic.Dimension.ReactionDimension;
    extends Dimensionality;

  end ReactionStructure;

  partial model StrUniUni "Structure Uni Uni "
    extends ReactionStructure(redeclare final class Dimensionality =
        Dimension.UniUni);
  end StrUniUni;

  partial model StrOneWay "Structure Uni Uni "
    extends ReactionStructure(redeclare final class Reversibility =
        Reversible.OneWay);
  end StrOneWay;

  annotation (
    Documentation(info = "<html><head></head><body><p>This subpackage contains basic interface for specifying the structure of a reaction, i.e. its dimension and reversibility see&nbsp;<a href=\"GenKinetics.Interfaces.Dynamic.Dimension.ReactionStructure\">GenKinetics.Interfaces.Dynamic.Dimension.ReactionStructure</a>&nbsp;. Out of this interface, specialized reaction types can be created as a syntactic sugar, e.g.<a href=\"GenKinetics.Interfaces.Dynamic.Dimension.StrOneWay\">GenKinetics.Interfaces.Dynamic.Dimension.StrOneWay</a>&nbsp;.</p><p><br>Licensed under the Modelica License 2</p><p><br>Copyright ©&nbsp;<a href=\"GenKinetics.UserGuide.CopyRight\" style=\"font-size: 12px;\">GenKinetics.UserGuide.CopyRight</a></p><p><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a>&nbsp;or visit<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p></body></html>"));
end Structure;
