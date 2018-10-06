within GenKinetics.Interfaces;

package Static
  extends Modelica.Icons.BasesPackage;

  partial model NodeConnections "Metabolite connections to reactions"
    extends GenKinetics.Icons.Node;
  extends GenKinetics.Interfaces.Dynamic.NodeConnections; 
    
    GenKinetics.Interfaces.Ports.ChemicalPort_N rc1 annotation(
      Placement(visible = true, transformation(extent = {{-84, 54}, {-14, 124}}, rotation = 0), iconTransformation(extent = {{-46, 50}, {50, 150}}, rotation = 0)));
    GenKinetics.Interfaces.Ports.ChemicalPort_N rc2 annotation(
      Placement(visible = true, transformation(extent = {{-84, 54}, {-14, 124}}, rotation = 0), iconTransformation(extent = {{52, -56}, {148, 44}}, rotation = 0)));
    GenKinetics.Interfaces.Ports.ChemicalPort_N rc3 annotation(
      Placement(visible = true, transformation(extent = {{-84, 54}, {-14, 124}}, rotation = 0), iconTransformation(extent = {{-46, -150}, {50, -50}}, rotation = 0)));
    GenKinetics.Interfaces.Ports.ChemicalPort_N rc4 annotation(
      Placement(visible = true, transformation(extent = {{-84, 54}, {-14, 124}}, rotation = 0), iconTransformation(extent = {{-156, -54}, {-60, 46}}, rotation = 0)));
    GenKinetics.Interfaces.Ports.ModifierChemicalPort_N mc1 annotation(
      Placement(transformation(extent = {{-30, 44}, {30, 104}}), iconTransformation(extent = {{-128, 68}, {-68, 128}})));
    GenKinetics.Interfaces.Ports.ModifierChemicalPort_N mc2 annotation(
      Placement(transformation(extent = {{-30, 44}, {30, 104}}), iconTransformation(extent = {{72, 68}, {132, 128}})));
    GenKinetics.Interfaces.Ports.ModifierChemicalPort_N mc3 annotation(
      Placement(transformation(extent = {{-30, 44}, {30, 104}}), iconTransformation(extent = {{70, -130}, {130, -70}})));
    GenKinetics.Interfaces.Ports.ModifierChemicalPort_N mc4 annotation(
      Placement(transformation(extent = {{-30, 44}, {30, 104}}), iconTransformation(extent = {{-130, -130}, {-70, -70}})));
  
  equation
  
  connect(rc1,rc);
  connect(rc2,rc);
  connect(rc3,rc); 
  connect(rc4,rc); 
  
  connect(mc1,mc);
  connect(mc2,mc); 
  connect(mc3,mc); 
  connect(mc4,mc);
  
  end NodeConnections;




  partial model Reaction1S "basic declaration of a reaction with one substrate"
    extends GenKinetics.Icons.Reaction;
    GenKinetics.Interfaces.Ports.ChemicalPort_S rc_S1 annotation(
      Placement(visible = true, transformation(extent = {{-36, 50}, {-16, 70}}, rotation = 0), iconTransformation(extent = {{-20, 80}, {20, 120}}, rotation = 0)));
  end Reaction1S;

  partial model Reaction2S "basic declaration of a reaction with two substrates"
    extends Interfaces.Static.Reaction1S;
    GenKinetics.Interfaces.Ports.ChemicalPort_S rc_S2 annotation(
      Placement(visible = true, transformation(extent = {{-36, 50}, {-16, 70}}, rotation = 0), iconTransformation(extent = {{-122, -22}, {-82, 18}}, rotation = 0)));
  end Reaction2S;

  partial model Reaction1P "basic declaration of a reaction with one product"
    extends GenKinetics.Icons.Reaction;
    GenKinetics.Interfaces.Ports.ChemicalPort_P rc_P1 annotation(
      Placement(visible = true, transformation(extent = {{-50, 6}, {-10, 46}}, rotation = 0), iconTransformation(extent = {{-22, -112}, {18, -72}}, rotation = 0)));
  end Reaction1P;

  partial model Reaction2P "basic declaration of a reaction with two products"
    extends Interfaces.Static.Reaction1P;
    GenKinetics.Interfaces.Ports.ChemicalPort_P rc_P2 annotation(
      Placement(visible = true, transformation(extent = {{-50, 6}, {-10, 46}}, rotation = 0), iconTransformation(extent = {{78, -22}, {118, 18}}, rotation = 0)));
  end Reaction2P;

  partial model Reaction1A "interface for activating a reaction"
    extends GenKinetics.Icons.Reaction;
    GenKinetics.Interfaces.Ports.ModifierChemicalPort_A mc_A1 annotation(
      Placement(visible = true, transformation(extent = {{-40, 80}, {0, 120}}, rotation = 0), iconTransformation(extent = {{-120, 76}, {-80, 116}}, rotation = 0)));
  
  end Reaction1A;

  partial model Reaction1I "interface for inhibiting a reaction"
    extends GenKinetics.Icons.Reaction;
    GenKinetics.Interfaces.Ports.ModifierChemicalPort_I mc_I1 annotation(
      Placement(visible = true, transformation(extent = {{-108, -12}, {-88, 8}}, rotation = 0), iconTransformation(extent = {{78, -116}, {118, -76}}, rotation = 0)));
    
  end Reaction1I;

  partial model Reaction1S1P
    extends GenKinetics.Interfaces.Static.Reaction1S;
    extends GenKinetics.Interfaces.Static.Reaction1P;
  end Reaction1S1P;

  annotation(
    Documentation(info = "<html><head></head><body><p>This subpackage contains basic icons for nodes and reactions. The nodes and the reactions are declared with a \"static\" fixed number of connectors.</p><p><br>Licensed under the Modelica License 2</p><p><br>Copyright ©&nbsp;<a href=\"GenKinetics.UserGuide.CopyRight\" style=\"font-size: 12px;\">GenKinetics.UserGuide.CopyRight</a></p><p><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a>&nbsp;or visit<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p></body></html>"));
end Static;
