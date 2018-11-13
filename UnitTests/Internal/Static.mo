within GenKinetics.UnitTests.Internal;
package Static
  model SvP "GenKinetics implementation of S => P"

  parameter GenKinetics.Units.AffinityConst km = 2.0;
  parameter GenKinetics.Units.Concentration S0 = 1.0;
  parameter Units.ReactionCoef vfwd = 1.0;

    Substances.Static.Substance S(c_0=S0);
    Substances.Static.Substance P(c_0=0);
    ReactionTypes.IrrUniUni v(km=km, Vmax=vfwd);
    Modelica.Blocks.Interfaces.RealOutput Sc annotation (
      Placement(visible = true, transformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Pc annotation (
      Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput r annotation (
      Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  equation

    connect(S.rc1,v.rc_S1);
    connect(v.rc_P1,P.rc2);

    Sc = S.c;
    Pc = P.c;
    v.v = r;

  annotation (
      Icon(graphics={  Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
  end SvP;
  replaceable class ReactionTypes =
      GenKinetics.Reactions.Convenience.Static;
  model SIvP "GenKinetics implementation of S +  I => P"

    parameter Real I0 = 0.3 "fixed concentration of inhibitor";
    parameter Real kI = 0.77;

    parameter GenKinetics.Units.AffinityConst km = 2.0;
    parameter GenKinetics.Units.Concentration S0 = 1.0;
    parameter Units.ReactionCoef vfwd = 1.0;
    Substances.Static.Substance S(c_0=S0);
    Substances.Static.Substance P(c_0=0);

    Substances.Dynamic.AmbientSubstance I(c_0=I0);
    ReactionTypes.IrrUniUniI1 v(
      km=km,
      ki=kI,
      Vmax=vfwd);
    Modelica.Blocks.Interfaces.RealOutput Sc annotation (
      Placement(visible = true, transformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Pc annotation (
      Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput r annotation (
      Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(S.rc1, v.rc_S1);
    connect(v.rc_P1, P.rc1);
    connect(v.mc_I1, I.mc);
    Sc = S.c;
    Pc = P.c;
    v.v = r;
    annotation (
      Icon(graphics={  Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
  end SIvP;

  model SvP_rev "GenKinetics implementation of S <=> P"

    parameter Real S0 = 1.0 "initial concentration of S";
    parameter Real vfwd = 1.5 "kinetic parameter";
    parameter Real vbwd = 0.5 "kinetic parameter";
    parameter Real kmS = 2.0 "kinetic parameter";
    parameter Real kmP = 0.3 "kinetic parameter";

    Substances.Static.Substance S(c_0=S0);
    Substances.Static.Substance P(c_0=0);
    ReactionTypes.RevUniUni v(
      kmS=kmS,
      kmP=kmP,
      Vfwdmax=vfwd,
      Vbwdmax=vbwd);
    Modelica.Blocks.Interfaces.RealOutput Sc annotation (
      Placement(visible = true, transformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Pc annotation (
      Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput r annotation (
      Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(S.rc1, v.rc_S1);
    connect(v.rc_P1, P.rc1);
    Sc = S.c;
    Pc = P.c;
    v.v = r;
    annotation (
      Icon(graphics={  Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
  end SvP_rev;

  model S1S2vP "GenKinetics implementation of S1 + S2 => P"

    parameter Real S10 = 1.0 "initial concentration of S";
    parameter Real S20 = 1.0 "initial concentration of S";
    parameter Real vfwd = 1.0 "kinetic parameter";
    parameter Real kmS1 = 1.5 "kinetic parameter";
    parameter Real kmS2 = 0.3 "kinetic parameter";

    Substances.Static.Substance S1(c_0=S10);
    Substances.Static.Substance S2(c_0=S20);
    Substances.Static.Substance P(c_0=0);

    ReactionTypes.IrrBiUni v(km1=kmS1, km2=kmS2, Vmax=vfwd);

    Modelica.Blocks.Interfaces.RealOutput S1c annotation (
      Placement(visible = true, transformation(origin = {104, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Pc annotation (
      Placement(visible = true, transformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput r annotation (
      Placement(visible = true, transformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput S2c annotation (
      Placement(visible = true, transformation(origin = {104, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  equation

    connect(S1.rc1, v.rc_S1);
    connect(S2.rc1, v.rc_S2);
    connect(v.rc_P1, P.rc1);

    S1c = S1.c;
    S2c = S2.c;
    Pc = P.c;
    v.v = r;

    annotation (
      Icon(graphics={  Rectangle(origin = {5, 0}, extent = {{-105, 100}, {95, -100}})}));
  end S1S2vP;
end Static;
