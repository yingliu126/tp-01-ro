\* # Problem: Voitures *\

\* # X1 = Voiture de luxe *\
\* # X2 = Voiture simples *\

Maximize
  Benefice: + 10000 X1 + 9000 X2

Subject To
  MaxSurface: + 10 X1 + 20 X2 <= 15000
  MaxVoituresLuxe: + X1 <= 800
  HeuresTravailMax: + 0.06 X1 + 0.05 X2 <= 60
Integer
  X1
  X2

End
