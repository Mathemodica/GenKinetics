within GenKinetics;
package Examples
  extends Modelica.Icons.ExamplesPackage;

  model SpirallusLinLog "An abstraction of the TCA cycle with dynamic arbitrary number of connections implemented "
    extends Modelica.Icons.Example;
    import GenKinetics.Substances.Dynamic.*;
    import GenKinetics.Reactions.LinLog.Dynamic.*;
  Substances.Dynamic.ReferencedAmbientSubstance Aex(c_0=0.1, c_steady=0.1);
    InhKinetic vupt(NS = 1, NP = 1, NI = 1, I0 = {A.c_steady}, S0 = {Aex.c_steady}, P0 = {A.c_steady}, alpha = {0.77}, theta = {0.33}, delta = {0.45}, v_steady = 0.5);
  Substances.Dynamic.ReferencedSubstance A(c_0=0.01, c_steady=0.026);
    Kinetic v1(NS = 1, NP = 1, S0 = {A.c_steady}, P0 = {B.c_steady}, alpha = {2.1}, theta = {-0.3}, v_steady = 0.5);
  Substances.Dynamic.ReferencedSubstance B(c_0=0.2, c_steady=0.323);
    Kinetic v5(NS = 1, NP = 1, S0 = {B.c_steady}, P0 = {E.c_steady}, alpha = {1.22}, theta = {0.45}, v_steady = 0.25);
  Substances.Dynamic.ReferencedSubstance E(c_0=18.3, c_steady=0.4258);
    Kinetic v2(NS = 2, NP = 1, S0 = {B.c_steady, E.c_steady}, P0 = {C.c_steady}, alpha = {1.56, 0.35}, theta = {0.45}, v_steady = 0.25);
    // B,E -v2-> C
  Substances.Dynamic.ReferencedSubstance C(c_0=18.5, c_steady=0.36);
    InhKinetic v3(NS = 1, NP = 2, NI = 1, S0 = {C.c_steady}, P0 = {D.c_steady, F.c_steady}, I0 = {D.c_steady}, alpha = {0.45}, theta = {-0.42, 1.2}, delta = {-1.2}, v_steady = 0.25);
  Substances.Dynamic.ReferencedSubstance D(c_0=0.01, c_steady=0.013);
  Substances.Dynamic.ReferencedSubstance F(c_0=18.1, c_steady=0.37);
    InhKinetic v4(NS = 1, NP = 2, NI = 1, S0 = {D.c_steady}, P0 = {E.c_steady, F.c_steady}, I0 = {C.c_steady}, alpha = {0.23}, theta = {0.33, 0.34}, delta = {-0.9}, v_steady = 0.25);
    Kinetic v6(NS = 1, NP = 1, S0 = {E.c_steady}, P0 = {Eex.c_steady}, alpha = {0.005}, theta = {0}, v_steady = 0.25);
  Substances.Dynamic.ReferencedSubstance Eex(c_0=10, c_steady=2.4);
    Kinetic v7(NS = 1, NP = 1, S0 = {F.c_steady}, P0 = {Fex.c_steady}, alpha = {0.005}, theta = {0.05}, v_steady = 0.48);
  Substances.Dynamic.ReferencedSubstance Fex(c_0=100, c_steady=4.2);
  equation
  // vupt
    connect(Aex.rc, vupt.rc_S[1]);
    connect(vupt.rc_P[1], A.rc);
    connect(vupt.mc_I[1], A.mc);
  // v1
    connect(A.rc, v1.rc_S[1]);
    connect(v1.rc_P[1], B.rc);
  // v5
    connect(B.rc, v5.rc_S[1]);
    connect(v5.rc_P[1], E.rc);
  // v2
    connect(B.rc, v2.rc_S[1]);
    connect(E.rc, v2.rc_S[2]);
    connect(v2.rc_P[1], C.rc);
  // v3
    connect(C.rc, v3.rc_S[1]);
    connect(v3.rc_P[1], D.rc);
    connect(v3.rc_P[2], F.rc);
    connect(D.mc, v3.mc_I[1]);
  // v4
    connect(D.rc, v4.rc_S[1]);
    connect(v4.rc_P[1], F.rc);
    connect(v4.rc_P[2], E.rc);
    connect(v4.mc_I[1], C.mc);
  // v6
    connect(E.rc, v6.rc_S[1]);
    connect(v6.rc_P[1], Eex.rc);
  // v7
    connect(F.rc, v7.rc_S[1]);
    connect(v7.rc_P[1], Fex.rc);
    annotation (
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
      __OpenModelica_simulationFlags(lv = "LOG_STATS", maxIntegrationOrder = "4", s = "dassl"));
  end SpirallusLinLog;












  model SpirallusStatic2 "Implementation of the Spiralus network using static connections"
  extends Modelica.Icons.Example;

  Substances.Static.AmbientSubstance Aex(c_0=0.1)
    annotation (Placement(transformation(extent={{-12,268},{8,288}})));
    Reactions.Convenience.Static2.IrrUniUniI1 vupt(km = 0.1, Vmax = 1.0, ki = 3.0) annotation (
      Placement(transformation(extent = {{-12, 224}, {8, 244}})));
  Substances.Static.Substance A(c_0=0.01)
    annotation (Placement(transformation(extent={{-12,178},{8,198}})));
    Reactions.Convenience.Static2.RevUniUni v1(kmS = 0.1, Vfwdmax = 3.0, kmP = 0.3, Vbwdmax = 1.0) annotation (
      Placement(transformation(extent = {{-12, 128}, {8, 148}})));
  Substances.Static.Substance B(c_0=0.2)
    annotation (Placement(transformation(extent={{-12,80},{8,100}})));
    Reactions.Convenience.Static2.RevUniUni v5(kmS = 1.0, Vfwdmax = 2.0, kmP = 1.0, Vbwdmax = 0.5) annotation (
      Placement(transformation(extent = {{-12, 28}, {8, 48}})));
  Substances.Static.Substance E(c_0=0.3)
    annotation (Placement(transformation(extent={{-12,-22},{8,-2}})));
    Reactions.Convenience.Static2.IrrBiUni v2(km1 = 0.25, km2 = 2.0, Vmax = 2.5) annotation (
      Placement(transformation(extent = {{76, -22}, {96, -2}})));
  Substances.Static.Substance C(c_0=0.5)
    annotation (Placement(transformation(extent={{120,-86},{140,-66}})));
    Reactions.Convenience.Static2.IrrUniBiI1 v3(km = 2.0, Vfwdmax = 2.0, ki = 0.05) annotation (
      Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {66, -112})));
  Substances.Static.Substance F(c_0=0.1)
    annotation (Placement(transformation(extent={{-98,-190},{-78,-170}})));
  Substances.Static.Substance D(c_0=0.01)
    annotation (Placement(transformation(extent={{-12,-122},{8,-102}})));
    Reactions.Convenience.Static2.IrrUniBiI1 v4(km = 0.1, Vfwdmax = 3.0, ki = 1.0) annotation (
      Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {-82, -82})));
  Substances.Static.Substance Fex(c_0=0.01)
    annotation (Placement(transformation(extent={{-158,-288},{-138,-268}})));
  Substances.Static.Substance Eex(c_0=0.01)
    annotation (Placement(transformation(extent={{-132,74},{-112,94}})));
    Reactions.Convenience.Static2.IrrUniUni v6(km = 3.0, Vmax = 2.0) annotation (
      Placement(transformation(extent = {{-98, 24}, {-78, 44}})));
  Reactions.Convenience.Static2.IrrUniUni v7(Vmax = 2.0, km = 3.0)  annotation (
      Placement(visible = true, transformation(origin = {-114, -230}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(v7.rc_P1, Fex.rc1) annotation (
      Line(points = {{-114, -240}, {-150, -240}, {-150, -268}, {-148, -268}}));
    connect(F.rc3, v7.rc_S1) annotation (
      Line(points = {{-88, -190}, {-116, -190}, {-116, -220}, {-114, -220}}));
    connect(Aex.rc3, vupt.rc_S1) annotation (
      Line(points = {{-1.8, 268}, {-2, 268}, {-2, 244}}, color = {0, 0, 0}));
    connect(Aex.mc3, vupt.mc_I1) annotation (
      Line(points = {{8, 268}, {40, 268}, {40, 224.4}, {7.8, 224.4}}, color = {0, 0, 0}));
    connect(vupt.rc_P1, A.rc1) annotation (
      Line(points = {{-2.2, 224.8}, {-2.2, 210.4}, {-1.8, 210.4}, {-1.8, 198}}, color = {0, 0, 0}));
    connect(A.rc3, v1.rc_S1) annotation (
      Line(points = {{-1.8, 178}, {-1.8, 162}, {-2, 162}, {-2, 148}}, color = {0, 0, 0}));
    connect(v1.rc_P1, B.rc1) annotation (
      Line(points = {{-2.2, 128.8}, {-2.2, 112.4}, {-1.8, 112.4}, {-1.8, 100}}, color = {0, 0, 0}));
    connect(B.rc3, v5.rc_S1) annotation (
      Line(points = {{-1.8, 80}, {-1.8, 63}, {-2, 63}, {-2, 48}}, color = {0, 0, 0}));
    connect(v5.rc_P1, E.rc1) annotation (
      Line(points = {{-2.2, 28.8}, {-2.2, 12.4}, {-1.8, 12.4}, {-1.8, -2}}, color = {0, 0, 0}));
    connect(B.rc2, v2.rc_S1) annotation (
      Line(points = {{8, 89.4}, {8, 90}, {86, 90}, {86, -2}}, color = {0, 0, 0}));
    connect(E.rc2, v2.rc_S2) annotation (
      Line(points = {{8, -12.6}, {43, -12.6}, {43, -12.2}, {75.8, -12.2}}, color = {0, 0, 0}));
    connect(v2.rc_P1, C.rc1) annotation (
      Line(points = {{85.8, -21.2}, {85.8, -43.6}, {130.2, -43.6}, {130.2, -66}}, color = {0, 0, 0}));
    connect(C.rc3, v3.rc_S1) annotation (
      Line(points = {{130.2, -86}, {103.1, -86}, {103.1, -112}, {76, -112}}, color = {0, 0, 0}));
    connect(D.rc2, v3.rc_P1) annotation (
      Line(points = {{8, -112.6}, {32, -112.6}, {32, -111.8}, {56.8, -111.8}}, color = {0, 0, 0}));
    connect(v3.rc_P2, F.rc2) annotation (
      Line(points = {{65.8, -121.8}, {66, -121.8}, {66, -180.6}, {-78, -180.6}}, color = {0, 0, 0}));
    connect(D.mc3, v3.mc_I1) annotation (
      Line(points = {{8, -122}, {32, -122}, {32, -121.8}, {56.4, -121.8}}, color = {0, 0, 0}));
    connect(v4.rc_S1, D.rc4) annotation (
      Line(points = {{-72, -82}, {-44, -82}, {-44, -112.4}, {-12.8, -112.4}}, color = {0, 0, 0}));
    connect(v4.mc_I1, C.mc1) annotation (
      Line(points = {{-91.6, -91.8}, {-58, -91.8}, {-58, -92}, {-26, -92}, {-26, -66.2}, {120.2, -66.2}}, color = {0, 0, 0}));
    connect(v4.rc_P2, F.rc1) annotation (
      Line(points = {{-82.2, -91.8}, {-82.2, -132.9}, {-87.8, -132.9}, {-87.8, -170}}, color = {0, 0, 0}));
    connect(v4.rc_P1, E.rc4) annotation (
      Line(points = {{-91.2, -81.8}, {-108.6, -81.8}, {-108.6, -12.4}, {-12.8, -12.4}}, color = {0, 0, 0}));
    connect(Eex.rc3, v6.rc_S1) annotation (
      Line(points = {{-121.8, 74}, {-104.9, 74}, {-104.9, 44}, {-88, 44}}, color = {0, 0, 0}));
    connect(v6.rc_P1, E.rc1) annotation (
      Line(points = {{-88.2, 24.8}, {-66, 24.8}, {-66, 24}, {-34, 24}, {-34, -2}, {-1.8, -2}}, color = {0, 0, 0}));
    annotation (
      Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.05, extent = {{-200, -300}, {200, 300}})),
      Diagram(coordinateSystem(preserveAspectRatio = false, initialScale = 0.05, extent = {{-200, -300}, {200, 300}})));
  end SpirallusStatic2;












  model SpirallusStatic3 "Implementation of the Spiralus network using static connections"
    extends Modelica.Icons.Example;

    import GenKinetics.Substances.Static.*;
    import GenKinetics.Reactions.Convenience.Static3.*;

  Substances.Static.AmbientSubstance Aex(c_0=0.1)
    annotation (Placement(transformation(extent={{-12,268},{8,288}})));
    IrrUniUniI1 vupt(km = 0.1, Vmax = 1.0, ki = 3.0) annotation (
      Placement(transformation(extent = {{-12, 224}, {8, 244}})));
  Substances.Static.Substance A(c_0=0.01)
    annotation (Placement(transformation(extent={{-12,178},{8,198}})));
    RevUniUni v1(kmS = 0.1, Vfwdmax = 3.0, kmP = 0.3, Vbwdmax = 1.0) annotation (
      Placement(transformation(extent = {{-12, 128}, {8, 148}})));
  Substances.Static.Substance B(c_0=0.2)
    annotation (Placement(transformation(extent={{-12,80},{8,100}})));
    RevUniUni v5(kmS = 1.0, Vfwdmax = 2.0, kmP = 1.0, Vbwdmax = 0.5) annotation (
      Placement(transformation(extent = {{-12, 28}, {8, 48}})));
  Substances.Static.Substance E(c_0=0.3)
    annotation (Placement(transformation(extent={{-12,-22},{8,-2}})));
    IrrBiUni v2(km1 = 0.25, km2 = 2.0, Vmax = 2.5) annotation (
      Placement(transformation(extent = {{76, -22}, {96, -2}})));
  Substances.Static.Substance C(c_0=0.5)
    annotation (Placement(transformation(extent={{120,-86},{140,-66}})));
    IrrUniBiI1 v3(km = 2.0, Vfwdmax = 2.0, ki = 0.05) annotation (
      Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {66, -112})));
  Substances.Static.Substance F(c_0=0.1)
    annotation (Placement(transformation(extent={{-98,-190},{-78,-170}})));
  Substances.Static.Substance D(c_0=0.01)
    annotation (Placement(transformation(extent={{-12,-122},{8,-102}})));
    IrrUniBiI1 v4(km = 0.1, Vfwdmax = 3.0, ki = 1.0) annotation (
      Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {-82, -82})));
  Substances.Static.Substance Fex(c_0=0.01)
    annotation (Placement(transformation(extent={{-158,-288},{-138,-268}})));
  Substances.Static.Substance Eex(c_0=0.01)
    annotation (Placement(transformation(extent={{-132,74},{-112,94}})));
    IrrUniUni v6(km = 3.0, Vmax = 2.0) annotation (
      Placement(transformation(extent = {{-98, 24}, {-78, 44}})));
    IrrUniUni v7(Vmax = 2.0, km = 3.0) annotation (
      Placement(visible = true, transformation(origin = {-114, -230}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(v7.rc_P1, Fex.rc1) annotation (
      Line(points = {{-114, -240}, {-150, -240}, {-150, -268}, {-148, -268}}));
    connect(F.rc3, v7.rc_S1) annotation (
      Line(points = {{-88, -190}, {-116, -190}, {-116, -220}, {-114, -220}}));
    connect(Aex.rc3, vupt.rc_S1) annotation (
      Line(points = {{-1.8, 268}, {-2, 268}, {-2, 244}}, color = {0, 0, 0}));
    connect(Aex.mc3, vupt.mc_I1) annotation (
      Line(points = {{8, 268}, {40, 268}, {40, 224.4}, {7.8, 224.4}}, color = {0, 0, 0}));
    connect(vupt.rc_P1, A.rc1) annotation (
      Line(points = {{-2.2, 224.8}, {-2.2, 210.4}, {-1.8, 210.4}, {-1.8, 198}}, color = {0, 0, 0}));
    connect(A.rc3, v1.rc_S1) annotation (
      Line(points = {{-1.8, 178}, {-1.8, 162}, {-2, 162}, {-2, 148}}, color = {0, 0, 0}));
    connect(v1.rc_P1, B.rc1) annotation (
      Line(points = {{-2.2, 128.8}, {-2.2, 112.4}, {-1.8, 112.4}, {-1.8, 100}}, color = {0, 0, 0}));
    connect(B.rc3, v5.rc_S1) annotation (
      Line(points = {{-1.8, 80}, {-1.8, 63}, {-2, 63}, {-2, 48}}, color = {0, 0, 0}));
    connect(v5.rc_P1, E.rc1) annotation (
      Line(points = {{-2.2, 28.8}, {-2.2, 12.4}, {-1.8, 12.4}, {-1.8, -2}}, color = {0, 0, 0}));
    connect(B.rc2, v2.rc_S1) annotation (
      Line(points = {{8, 89.4}, {8, 90}, {86, 90}, {86, -2}}, color = {0, 0, 0}));
    connect(E.rc2, v2.rc_S2) annotation (
      Line(points = {{8, -12.6}, {43, -12.6}, {43, -12.2}, {75.8, -12.2}}, color = {0, 0, 0}));
    connect(v2.rc_P1, C.rc1) annotation (
      Line(points = {{85.8, -21.2}, {85.8, -43.6}, {130.2, -43.6}, {130.2, -66}}, color = {0, 0, 0}));
    connect(C.rc3, v3.rc_S1) annotation (
      Line(points = {{130.2, -86}, {103.1, -86}, {103.1, -112}, {76, -112}}, color = {0, 0, 0}));
    connect(D.rc2, v3.rc_P1) annotation (
      Line(points = {{8, -112.6}, {32, -112.6}, {32, -111.8}, {56.8, -111.8}}, color = {0, 0, 0}));
    connect(v3.rc_P2, F.rc2) annotation (
      Line(points = {{65.8, -121.8}, {66, -121.8}, {66, -180.6}, {-78, -180.6}}, color = {0, 0, 0}));
    connect(D.mc3, v3.mc_I1) annotation (
      Line(points = {{8, -122}, {32, -122}, {32, -121.8}, {56.4, -121.8}}, color = {0, 0, 0}));
    connect(v4.rc_S1, D.rc4) annotation (
      Line(points = {{-72, -82}, {-44, -82}, {-44, -112.4}, {-12.8, -112.4}}, color = {0, 0, 0}));
    connect(v4.mc_I1, C.mc1) annotation (
      Line(points = {{-91.6, -91.8}, {-58, -91.8}, {-58, -92}, {-26, -92}, {-26, -66.2}, {120.2, -66.2}}, color = {0, 0, 0}));
    connect(v4.rc_P2, F.rc1) annotation (
      Line(points = {{-82.2, -91.8}, {-82.2, -132.9}, {-87.8, -132.9}, {-87.8, -170}}, color = {0, 0, 0}));
    connect(v4.rc_P1, E.rc4) annotation (
      Line(points = {{-91.2, -81.8}, {-108.6, -81.8}, {-108.6, -12.4}, {-12.8, -12.4}}, color = {0, 0, 0}));
    connect(Eex.rc3, v6.rc_S1) annotation (
      Line(points = {{-121.8, 74}, {-104.9, 74}, {-104.9, 44}, {-88, 44}}, color = {0, 0, 0}));
    connect(v6.rc_P1, E.rc1) annotation (
      Line(points = {{-88.2, 24.8}, {-66, 24.8}, {-66, 24}, {-34, 24}, {-34, -2}, {-1.8, -2}}, color = {0, 0, 0}));
    annotation (
      Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.05, extent = {{-200, -300}, {200, 300}})),
      Diagram(coordinateSystem(preserveAspectRatio = false, initialScale = 0.05, extent = {{-200, -300}, {200, 300}})));
  end SpirallusStatic3;

  annotation (
    Documentation(info = "<html><head></head><body><p style=\"font-size: 12px;\">This subpackage contains examples of typical metablic pathway models.</p><p style=\"font-size: 12px;\"><br>Licensed under the Modelica License 2</p><p style=\"font-size: 12px;\"><br>Copyright ©&nbsp;<a href=\"GenKinetics.UserGuide.CopyRight\">GenKinetics.UserGuide.CopyRight</a></p><p style=\"font-size: 12px;\"><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica:///Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p></body></html>"));
end Examples;
