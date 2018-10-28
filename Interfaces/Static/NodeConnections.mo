within GenKinetics.Interfaces.Static;
partial model NodeConnections "Metabolite connections to reactions"
  extends GenKinetics.Icons.Node;
  extends GenKinetics.Interfaces.Dynamic.NodeConnections;

// GenKinetics.Interfaces.Dynamic.NodeConnections nc;

  GenKinetics.Interfaces.Ports.ChemicalPort_N rc1 annotation (Placement(
      visible=true,
      transformation(extent={{-84,54},{-14,124}}, rotation=0),
      iconTransformation(extent={{-46,50},{50,150}}, rotation=0)));
  GenKinetics.Interfaces.Ports.ChemicalPort_N rc2 annotation (Placement(
      visible=true,
      transformation(extent={{-84,54},{-14,124}}, rotation=0),
      iconTransformation(extent={{52,-56},{148,44}}, rotation=0)));
  GenKinetics.Interfaces.Ports.ChemicalPort_N rc3 annotation (Placement(
      visible=true,
      transformation(extent={{-84,54},{-14,124}}, rotation=0),
      iconTransformation(extent={{-46,-150},{50,-50}}, rotation=0)));
  GenKinetics.Interfaces.Ports.ChemicalPort_N rc4 annotation (Placement(
      visible=true,
      transformation(extent={{-84,54},{-14,124}}, rotation=0),
      iconTransformation(extent={{-156,-54},{-60,46}}, rotation=0)));
  GenKinetics.Interfaces.Ports.ModifierChemicalPort_N mc1 annotation (Placement(
        transformation(extent={{-30,44},{30,104}}), iconTransformation(extent={
            {-128,68},{-68,128}})));
  GenKinetics.Interfaces.Ports.ModifierChemicalPort_N mc2 annotation (Placement(
        transformation(extent={{-30,44},{30,104}}), iconTransformation(extent={
            {72,68},{132,128}})));
  GenKinetics.Interfaces.Ports.ModifierChemicalPort_N mc3 annotation (Placement(
        transformation(extent={{-30,44},{30,104}}), iconTransformation(extent={
            {70,-130},{130,-70}})));
  GenKinetics.Interfaces.Ports.ModifierChemicalPort_N mc4 annotation (Placement(
        transformation(extent={{-30,44},{30,104}}), iconTransformation(extent={
            {-130,-130},{-70,-70}})));

equation

connect(rc1,rc);
connect(rc2,rc);
connect(rc3,rc);
connect(rc4,rc);

connect(mc1,mc);
connect(mc2,mc);
connect(mc3,mc);
connect(mc4,mc);

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
end NodeConnections;
