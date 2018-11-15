within GenKinetics.Substances.Auto;
model Substance "Metabolite with dynamic rate"
  extends GenKinetics.Substances.Auto.BasicSubstance;
  parameter Units.Concentration tolerance=1e-6;
equation
 der(c) = if
            (c < tolerance and r_net < 0) then 0 else r_net;
 // der(c) = r_net;
end Substance;
