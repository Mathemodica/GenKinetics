within GenKinetics.Reactions.Convenience;

package Dynamic
  extends Modelica.Icons.Package;

  partial model BasicReaction "basic declaration of a reaction "
    extends Interfaces.Dynamic.Dimension.ReactionDimension;
    Units.VolumetricReactionRate v "Reaction Rate";
    // Connections to Substrates and Products
    GenKinetics.Interfaces.Ports.ChemicalPort_S rc_S[NS] "connection to substrates";
    GenKinetics.Interfaces.Ports.ChemicalPort_P rc_P[NP] "connection to product";
  equation
    rc_S[:].r = n_S[:] * v;
    rc_P[:].r = -n_P[:] * v;
  end BasicReaction;



  annotation(
    Documentation(info = "<html><head></head><body><h2><font size=\"3\">Reactions with parameterized number of connections suitable for model generation and textual implementation</font></h2><p style=\"font-size: 12px;\"><strong><u>Information</u></strong></p><div class=\"textDoc\"><p style=\"font-family: 'Courier New'; font-size: 12px;\"></p></div><div class=\"htmlDoc\"><p>This subpackage contains components for reactions with arbitrary number of substrates, products and effectors. It is suitable for textual implementation and automatic model generation.</p><p><br>Licensed under the Modelica License 2</p><p><br>Copyright ©&nbsp;<a href=\"GenKinetics.UserGuide.CopyRight\" style=\"font-size: 12px;\">GenKinetics.UserGuide.CopyRight</a></p><p><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica:///Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p></div></body></html>"));
end Dynamic;
