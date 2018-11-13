within GenKinetics.Examples;
model SpirallusStatic
  "Implementation of the Spiralus network using static connections"
  extends Modelica.Icons.Example;

  Substances.Static.AmbientSubstance Aex(c_0=0.1)
    annotation (Placement(transformation(extent={{-12,268},{8,288}})));
  Reactions.Convenience.Static3.IrrUniUniI1 vupt(
    km=0.1,
    Vmax=1.0,
    ki=3.0) annotation (Placement(transformation(extent={{-12,224},{8,244}})));
  Substances.Static.Substance A(c_0=0.01)
    annotation (Placement(transformation(extent={{-12,178},{8,198}})));
  Reactions.Convenience.Static3.RevUniUni v1(
    kmS=0.1,
    Vfwdmax=3.0,
    kmP=0.3,
    Vbwdmax=1.0)
    annotation (Placement(transformation(extent={{-12,128},{8,148}})));
  Substances.Static.Substance B(c_0=0.2)
    annotation (Placement(transformation(extent={{-12,80},{8,100}})));
  Reactions.Convenience.Static3.RevUniUni v5(
    kmS=1.0,
    Vfwdmax=2.0,
    kmP=1.0,
    Vbwdmax=0.5)
    annotation (Placement(transformation(extent={{-12,28},{8,48}})));
  Substances.Static.Substance E(c_0=0.3)
    annotation (Placement(transformation(extent={{-12,-22},{8,-2}})));
  Reactions.Convenience.Static3.IrrBiUni v2(
    km1=0.25,
    km2=2.0,
    Vmax=2.5) annotation (Placement(transformation(extent={{76,-22},{96,-2}})));
  Substances.Static.Substance C(c_0=0.5)
    annotation (Placement(transformation(extent={{120,-86},{140,-66}})));
  Reactions.Convenience.Static3.IrrUniBiI1 v3(
    km=2.0,
    Vfwdmax=2.0,
    ki=0.05) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={66,-112})));
  Substances.Static.Substance F(c_0=0.1)
    annotation (Placement(transformation(extent={{-98,-190},{-78,-170}})));
  Substances.Static.Substance D(c_0=0.01)
    annotation (Placement(transformation(extent={{-12,-122},{8,-102}})));
  Reactions.Convenience.Static3.IrrUniBiI1 v4(
    km=0.1,
    Vfwdmax=3.0,
    ki=1.0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-82,-82})));
  Reactions.Convenience.Static3.IrrUniUni irrUniUni(km=3.0, Vmax=2.0)
    annotation (Placement(transformation(extent={{-118,-240},{-98,-220}})));
  Substances.Static.Substance Fex(c_0=0.01)
    annotation (Placement(transformation(extent={{-158,-288},{-138,-268}})));
  Substances.Static.Substance Eex(c_0=0.01)
    annotation (Placement(transformation(extent={{-132,74},{-112,94}})));
  Reactions.Convenience.Static3.IrrUniUni v6(km=3.0, Vmax=2.0)
    annotation (Placement(transformation(extent={{-98,24},{-78,44}})));
equation
  connect(Aex.rc3, vupt.rc_S1)
    annotation (Line(points={{-1.8,268},{-2,268},{-2,244}}, color={0,0,0}));
  connect(Aex.mc3, vupt.mc_I1) annotation (Line(points={{8,268},{40,268},{40,
          224.4},{7.8,224.4}}, color={0,0,0}));
  connect(vupt.rc_P1, A.rc1) annotation (Line(points={{-2.2,224.8},{-2.2,210.4},
          {-1.8,210.4},{-1.8,198}}, color={0,0,0}));
  connect(A.rc3, v1.rc_S1) annotation (Line(points={{-1.8,178},{-1.8,162},{-2,
          162},{-2,148}}, color={0,0,0}));
  connect(v1.rc_P1, B.rc1) annotation (Line(points={{-2.2,128.8},{-2.2,112.4},{
          -1.8,112.4},{-1.8,100}}, color={0,0,0}));
  connect(B.rc3, v5.rc_S1) annotation (Line(points={{-1.8,80},{-1.8,63},{-2,63},
          {-2,48}}, color={0,0,0}));
  connect(v5.rc_P1, E.rc1) annotation (Line(points={{-2.2,28.8},{-2.2,12.4},{
          -1.8,12.4},{-1.8,-2}}, color={0,0,0}));
  connect(B.rc2, v2.rc_S1)
    annotation (Line(points={{8,89.4},{8,90},{86,90},{86,-2}}, color={0,0,0}));
  connect(E.rc2, v2.rc_S2) annotation (Line(points={{8,-12.6},{43,-12.6},{43,
          -12.2},{75.8,-12.2}}, color={0,0,0}));
  connect(v2.rc_P1, C.rc1) annotation (Line(points={{85.8,-21.2},{85.8,-43.6},{
          130.2,-43.6},{130.2,-66}}, color={0,0,0}));
  connect(C.rc3, v3.rc_S1) annotation (Line(points={{130.2,-86},{103.1,-86},{
          103.1,-112},{76,-112}}, color={0,0,0}));
  connect(D.rc2, v3.rc_P1) annotation (Line(points={{8,-112.6},{32,-112.6},{32,
          -111.8},{56.8,-111.8}}, color={0,0,0}));
  connect(v3.rc_P2, F.rc2) annotation (Line(points={{65.8,-121.8},{66,-121.8},{
          66,-180.6},{-78,-180.6}}, color={0,0,0}));
  connect(D.mc3, v3.mc_I1) annotation (Line(points={{8,-122},{32,-122},{32,
          -121.8},{56.4,-121.8}}, color={0,0,0}));
  connect(v4.rc_S1, D.rc4) annotation (Line(points={{-72,-82},{-44,-82},{-44,
          -112.4},{-12.8,-112.4}}, color={0,0,0}));
  connect(v4.mc_I1, C.mc1) annotation (Line(points={{-91.6,-91.8},{-58,-91.8},{
          -58,-92},{-26,-92},{-26,-66.2},{120.2,-66.2}}, color={0,0,0}));
  connect(v4.rc_P2, F.rc1) annotation (Line(points={{-82.2,-91.8},{-82.2,-132.9},
          {-87.8,-132.9},{-87.8,-170}}, color={0,0,0}));
  connect(v4.rc_P1, E.rc4) annotation (Line(points={{-91.2,-81.8},{-108.6,-81.8},
          {-108.6,-12.4},{-12.8,-12.4}}, color={0,0,0}));
  connect(F.rc3, irrUniUni.rc_S1) annotation (Line(points={{-87.8,-190},{-90,
          -190},{-90,-208},{-108,-208},{-108,-218},{-108,-218},{-108,-220},{
          -108,-220}}, color={0,0,0}));
  connect(irrUniUni.rc_P1, Fex.rc2) annotation (Line(points={{-108.2,-239.2},{
          -108.2,-258},{-108,-258},{-108,-278},{-138,-278},{-138,-278.6}},
        color={0,0,0}));
  connect(Eex.rc3, v6.rc_S1) annotation (Line(points={{-121.8,74},{-104.9,74},{
          -104.9,44},{-88,44}}, color={0,0,0}));
  connect(v6.rc_P1, E.rc1) annotation (Line(points={{-88.2,24.8},{-66,24.8},{
          -66,24},{-34,24},{-34,-2},{-1.8,-2}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(
        preserveAspectRatio=false,
        initialScale=0.05,
        extent={{-200,-300},{200,300}})), Diagram(coordinateSystem(
        preserveAspectRatio=false,
        initialScale=0.05,
        extent={{-200,-300},{200,300}})));
end SpirallusStatic;
