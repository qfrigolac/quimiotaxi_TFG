# Solució numèrica de les equacions de la Quimiotaxi
 Resolució numèrica de les equacions de la quimiotaxi. TFG del grau de Física. El model que es resol es troba descrit en l'article de Brenner et al. (1997) "Physical mechanisms for chemotactic pattern formation by bacteria".

 La part principal d'aquest programa està escrita en MATLAB i consiteix en 3 programes que es detallen a la [secció 2](#2-funcionament-del-programa) d'aquest escrit. A part, hi ha una sèrie de programes auxiliars, principalment per fer els gràfics del treball, que també s'inclouen en aquest repositori públic i es troben descrits a la [secció 3](#3-programes-auxiliars). Finalment, a la [secció 1](#1-paràmetres-disponibles) trobem una llista dels paràmetres que s'estudiaran al treball i el nom que se'ls ha donat en tots els codis d'aquest repositori.

## 1. Paràmetres disponibles
Els paràmetres disponibles que es poden modificar en aquest treball son els següents:

| Paràmetre | Significat/Funció |
|:----------|:----------------- |
|N | Nombre de cel·les a la graella de la discretizació espacial (quantitat de quadrats en el qual es partirà el domini, que és el quadrat resultant de les NxN cel·les de lateral h)|
| h | Lateral del les cel·les de la graella de la discretizació espacial. |
| dt | Pas del temps. Al treball com a $\Delta t$.
| Db | Constant de difusió dels bacteris. Al treball com a $D_b$ |
| Dc | Constant de difusió de l'atractant. Al treball com a $D_c$ |
| Df | Constant de difusió del succinat. Al treball com a $D_f$. (Només en els programes "_succinat.m". |
| k | Constant de quimiotaxi. En el treball com a $k$. |
| a | Constant de replicació dels bacteris. En el treball com a $a$. |
| alp | Constant de producció de l'atractant. En el treball com a $\alpha$. |
| gam | Constant de consum del succinat. Al treball com a $\gamma$. (Només en els programes "_succinat.m". |
| n1 | Meitat del quadrat d'atractant inicial. Al treball com a $l/2$. |
| n2 | Meitat del quadrat de succinat inicial. Al treball com a $l_f/2$. (Només en els programes "_succinat.m". |
| f0 | Concentració inicial de succinat. Al treball com a $f_0$.


## 2. Funcionament del programa
El programa principal per fer la discretització és a la funció `Quimiotaxi.m`. La funció `Simulacio.m` executa el mètode de Runge-Kutta usant la discretització de la funció anterior. El programa `TFG.m` està dissenyat per a fer les simulacions de forma automatizada. Veiem que el programa utilitza un `parfor`. En MATLAB, el `parfor` és un bucle en que cada instància s'executa en un fil del processador diferent. Convé ajustar els paràmetres de l'anomenat "Parallel pooling" a cada processador per treure'n el màxim partit.

A continuació es detalla cada funció quins inputs i outputs té:



### 2.1. Funció `Quimiotaxi.m`
La funció `Quimiotaxi.m` és la que fa les computacions de la discretització tal com es descriu a la secció 2.2 del treball. 


| Input | Funció                                                                                                               |
| :----- | :------------------------------------------------------------------------------------------------------------------- |
| p | Matriu que desciu la concentració de bacteris ($\rho$) al domini en el qual es fa la discretizació.   |
| c | Matriu que desciu la concentració d'atractant ($c$) al domini en el qual es fa la discretizació. |

La resta d'imputs de la funció son N, Db, Dc, h, k, a, alp que s'han descrit a l'apartat de [paràmetres](#1-paràmetres-disponibles).

Falta escriure els outputs!

### 2.2. Funció `Simulació.m`
Falta escriure-ho!

### 2.3. Funcions `_succinat.m`
Les funcions que tenen al nom "_succinat" fan els mateixos calculs que les funcions descrites anteriorment però afegint les solucuions pel succinat, descrites a l'apartat 2.6 del treball.

## 3. Programes auxiliars
### 3.1. Programa `Grafics.m`
Falta escriure-ho!

### 3.2. Programa Python
Falta escriure-ho!


## 4. Autoria
Codis escrits per Joaquim Frigola Casals. Vull agrair a Joan Frigola Rissech l'assassorament i l'ajuda a l'hora de fer els gràfics amb Python.