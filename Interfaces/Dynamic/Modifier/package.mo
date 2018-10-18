within GenKinetics.Interfaces.Dynamic;

package Modifier
  extends Modelica.Icons.Package;





  model OneActivator
    extends GenKinetics.Interfaces.Dynamic.Modifier.ReactionActivation(redeclare parameter Integer NA = 1);
  end OneActivator;



  extends Modelica.Icons.Package;





  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;
  extends Modelica.Icons.Package;

  model TwoActivators
    extends GenKinetics.Interfaces.Dynamic.Modifier.ReactionActivation(redeclare final parameter Integer NA = 2);
  end TwoActivators;







  partial model ReactionInhibition
    parameter Integer NI;
  end ReactionInhibition;





  model NoInhibition
    extends GenKinetics.Interfaces.Dynamic.Modifier.ReactionInhibition(redeclare final parameter Integer NI = 0);
  end NoInhibition;






  model OneInhibitor
    extends GenKinetics.Interfaces.Dynamic.Modifier.ReactionInhibition(redeclare final parameter Integer NI = 1);
  end OneInhibitor;






  model TwoInhibitors
    extends GenKinetics.Interfaces.Dynamic.Modifier.ReactionInhibition(redeclare final parameter Integer NI = 2);
  end TwoInhibitors;





  model UnspecifiedInhibition "to be specified at top model"
    extends GenKinetics.Interfaces.Dynamic.Modifier.ReactionInhibition;
  end UnspecifiedInhibition;





  model UnspecifiedActivation "to be specified at top model"
    extends GenKinetics.Interfaces.Dynamic.Modifier.ReactionActivation;
  end UnspecifiedActivation;

  annotation(
    Documentation(info = "<html><head></head><body>Interfaces specifying modifiers (inhibition or activation) for reactions<div><br></div><div><p style=\"font-size: 12px;\">Licensed under the Modelica License 2</p><p style=\"font-size: 12px;\"><br>Copyright ©&nbsp;<a href=\"GenKinetics.UserGuide.CopyRight\">GenKinetics.UserGuide.CopyRight</a></p><p style=\"font-size: 12px;\"><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica:///Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p></div></body></html>"));

end Modifier;
