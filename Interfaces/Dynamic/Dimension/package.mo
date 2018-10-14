within GenKinetics.Interfaces.Dynamic;
package Dimension
  extends Modelica.Icons.BasesPackage;

  partial model ReactionDimension "Dimension and structure of a reaction"
    parameter Integer NS = 1 "number of substrates";
    parameter Units.StoichiometricCoef n_S[NS] = ones(NS) "stoichiometry of all subtrates";
    parameter Integer NP = 1 "number of products";
    parameter Units.StoichiometricCoef n_P[NP] = ones(NP) "stoichiometry of all products";
  end ReactionDimension;

  partial model UniUni "S => P"
    extends ReactionDimension(redeclare final parameter Integer NS = 1, redeclare final parameter Integer NP = 1);
  end UniUni;


  partial model BiUni "S1 + S2 => P"
    extends ReactionDimension(redeclare final parameter Integer NS = 2, redeclare final parameter Integer NP = 1);
  end BiUni;


  partial model UniBi "S => P1 + P2"
    extends ReactionDimension(redeclare final parameter Integer NS = 1, redeclare final parameter Integer NP = 2);
  end UniBi;


  partial model BiBi "S1 + S2 => P1 + P2"
    extends ReactionDimension(redeclare final parameter Integer NS = 2, redeclare final parameter Integer NP = 2);
  end BiBi;

  annotation (
    Documentation(info = "<html><head></head><body><p>This subpackage contains basic interface for specifying the dimension of the reaction, see&nbsp;<a href=\"GenKinetics.Interfaces.dynamic.Dimension.ReactionDimension\">GenKinetics.Interfaces.dynamic.Dimension.ReactionDimension</a>&nbsp;. Out of this interface, specialized reaction types can be created as a syntactic sugar, e.g.&nbsp;<a href=\"GenKinetics.Interfaces.dynamic.Dimension.UniUni\">GenKinetics.Interfaces.dynamic.Dimension.UniUni</a>&nbsp;.</p><p><br>Licensed under the Modelica License 2</p><p><br>Copyright ©&nbsp;<a href=\"GenKinetics.UserGuide.CopyRight\" style=\"font-size: 12px;\">GenKinetics.UserGuide.CopyRight</a></p><p><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p></body></html>"));
end Dimension;
