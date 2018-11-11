within GenKinetics.Substances.Static;
model Substance "Metabolite with dynamic rate"
  extends BasicSubstance;
  parameter Units.Concentration tolerance=1e-6;
equation
  // der(c) = r_net;
  der(c) = if
             (c < tolerance and r_net < 0) then 0 else r_net;
end Substance;
