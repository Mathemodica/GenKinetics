within GenKinetics.Interfaces.Substances;
partial model SubstanceConnections "Metabolite connections to reactions"
  extends GenKinetics.Icons.Node;
  extends GenKinetics.Interfaces.Substances.Auto.SubstanceConnections;
  // GenKinetics.Interfaces.Dynamic.NodeConnections nc;

  GenKinetics.Interfaces.Nodes.SubstanceConnector rc1 annotation (Placement(
      visible=true,
      transformation(extent={{-84,54},{-14,124}}, rotation=0),
      iconTransformation(extent={{-46,50},{50,150}}, rotation=0)));
  GenKinetics.Interfaces.Nodes.SubstanceConnector rc2 annotation (Placement(
      visible=true,
      transformation(extent={{-84,54},{-14,124}}, rotation=0),
      iconTransformation(extent={{52,-56},{148,44}}, rotation=0)));
  GenKinetics.Interfaces.Nodes.SubstanceConnector rc3 annotation (Placement(
      visible=true,
      transformation(extent={{-84,54},{-14,124}}, rotation=0),
      iconTransformation(extent={{-46,-150},{50,-50}}, rotation=0)));
  GenKinetics.Interfaces.Nodes.SubstanceConnector rc4 annotation (Placement(
      visible=true,
      transformation(extent={{-84,54},{-14,124}}, rotation=0),
      iconTransformation(extent={{-156,-54},{-60,46}}, rotation=0)));
  GenKinetics.Interfaces.Nodes.ModifierConnector mc1 annotation (Placement(
        transformation(extent={{-30,44},{30,104}}), iconTransformation(extent={
            {-128,68},{-68,128}})));
  GenKinetics.Interfaces.Nodes.ModifierConnector mc2 annotation (Placement(
        transformation(extent={{-30,44},{30,104}}), iconTransformation(extent={
            {72,68},{132,128}})));
  GenKinetics.Interfaces.Nodes.ModifierConnector mc3 annotation (Placement(
        transformation(extent={{-30,44},{30,104}}), iconTransformation(extent={
            {70,-130},{130,-70}})));
  GenKinetics.Interfaces.Nodes.ModifierConnector mc4 annotation (Placement(
        transformation(extent={{-30,44},{30,104}}), iconTransformation(extent={
            {-130,-130},{-70,-70}})));

equation

  rc1.c = rc.c;
  rc2.c = rc.c;
  rc3.c = rc.c;
  rc4.c = rc.c;

  mc1.c = mc.c;
  mc2.c = mc.c;
  mc3.c = mc.c;
  mc4.c = mc.c;

  // rc1.r + rc2.r + rc3.r + rc4.r + rc.r = 0;

/*
connect(rc1,rc);
connect(rc2,rc);
connect(rc3,rc);
connect(rc4,rc);

connect(mc1,mc);
connect(mc2,mc);
connect(mc3,mc);
connect(mc4,mc);
*/

/*
connect(rc1,nc.rc);
connect(rc2,nc.rc);
connect(rc3,nc.rc);
connect(rc4,nc.rc);

connect(mc1,nc.mc);
connect(mc2,nc.mc);
connect(mc3,nc.mc);
connect(mc4,nc.mc);
*/

end SubstanceConnections;
