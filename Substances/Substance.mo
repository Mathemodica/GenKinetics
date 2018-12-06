within GenKinetics.Substances;
model Substance "Metabolite with dynamic concentration rate"
  import GenKinetics;
  extends GenKinetics.Substances.BasicSubstance;
  parameter Units.Concentration tolerance=1e-6;
equation
  // der(c) = r_net;
  der(c) = if
             (c < tolerance and r_net < 0) then 0 else r_net;
end Substance;
