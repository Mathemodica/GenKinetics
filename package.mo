package GenKinetics
  extends Modelica.Icons.Library;





  annotation (
    Documentation(info = "<html><head></head><body><p>This package contains an implementation of generalized simplified kinetic formats following the guidelines recommended by the&nbsp;<a href=\"https://modelica.org/publications/papers/2005-05-LarsdotterNilsson-Fritzson-BioMedSim2005-MetabolicModeling.pdf\">Biochem library</a>. Matabolic reaction networks can be easily assembled using a few number of reaction kinetics. Constructed models can also be used for computing parameter sensitivities with little modifications to the used interfaces and by initializing the input Jacobian, i.e. the parameters w.r.t. derivatives are sought.</p><p><br>Licensed under the Modelica License 2</p><p><br>Copyright ©&nbsp;<a href=\"GenKinetics.UserGuide.CopyRight\" style=\"font-size: 12px;\">GenKinetics.UserGuide.CopyRight</a></p><p><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a>&nbsp;or visit<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p></body></html>"),
    uses(Modelica(version = "3.2.3"),BioChem(version = "1.0.2")),
    version = "1.0.1");
end GenKinetics;
