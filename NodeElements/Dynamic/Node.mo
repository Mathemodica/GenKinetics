within GenKinetics.NodeElements.Dynamic;
model Node "Metabolite with dynamic rate"
  extends GenKinetics.NodeElements.Dynamic.BasicNode;
  parameter Units.Concentration tolerance=1e-6;
equation
 der(c) = if
            (c < tolerance and r_net < 0) then 0 else r_net;
 // der(c) = r_net;
end Node;
