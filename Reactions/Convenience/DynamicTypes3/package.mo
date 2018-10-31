within GenKinetics.Reactions.Convenience;
package DynamicTypes3
  model IrrUniUni "S => P"
    extends Generic.Kinetic(NS = 1, NP = 1, NI = 0, NA = 0, Reversible = false);
  end IrrUniUni;

  model IrrUniUniI1 "S => P"
    extends Generic.Kinetic(NS = 1, NP = 1, NI = 1, NA = 0, Reversible = false);
  end IrrUniUniI1;

  model RevUniUni "S => P"
    extends Generic.Kinetic(NS = 1, NP = 1, NI = 0, NA = 0, Reversible = true);
  end RevUniUni;

  model IrrBiUni "S => P"
    extends Generic.Kinetic(NS = 2, NP = 1, NI = 0, NA = 0, Reversible = false);
  end IrrBiUni;

  model IrrUniBiI1 "S => P"
    extends Generic.Kinetic(NS = 1, NP = 2, NI = 1, NA = 0, Reversible = false);
  end IrrUniBiI1;




end DynamicTypes3;
