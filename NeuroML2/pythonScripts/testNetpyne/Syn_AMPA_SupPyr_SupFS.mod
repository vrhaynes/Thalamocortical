TITLE Mod file for component: Component(id=Syn_AMPA_SupPyr_SupFS type=alphaSynapse)

COMMENT

    This NEURON file has been generated by org.neuroml.export (see https://github.com/NeuroML/org.neuroml.export)
         org.neuroml.export  v1.5.0
         org.neuroml.model   v1.5.0
         jLEMS               v0.9.8.7

ENDCOMMENT

NEURON {
    POINT_PROCESS Syn_AMPA_SupPyr_SupFS
    RANGE tau                               : parameter
    RANGE gbase                             : parameter
    RANGE erev                              : parameter
    
    RANGE i                                 : exposure
    
    
    NONSPECIFIC_CURRENT i 
    
}

UNITS {
    
    (nA) = (nanoamp)
    (uA) = (microamp)
    (mA) = (milliamp)
    (A) = (amp)
    (mV) = (millivolt)
    (mS) = (millisiemens)
    (uS) = (microsiemens)
    (molar) = (1/liter)
    (kHz) = (kilohertz)
    (mM) = (millimolar)
    (um) = (micrometer)
    (umol) = (micromole)
    (S) = (siemens)
    
}

PARAMETER {
    
    tau = 0.79999995 (ms)
    gbase = 8.829106E-4 (uS)
    erev = 0 (mV)
}

ASSIGNED {
    ? Standard Assigned variables with baseSynapse
    v (mV)
    celsius (degC)
    temperature (K)
    
    i (nA)                                 : derived variable
    rate_g (uS/ms)
    rate_A (uS/ms)
    
}

STATE {
    g (uS) 
    A (uS) 
    
}

INITIAL {
    temperature = celsius + 273.15
    
    rates()
    rates() ? To ensure correct initialisation.
    
    g = 0
    
    A = 0
    
}

BREAKPOINT {
    
    SOLVE states METHOD cnexp
    
    
}

NET_RECEIVE(weight) {
    ?state_discontinuity(A, A  + (  gbase  *weight)) : From Syn_AMPA_SupPyr_SupFS
    A = A  + (  gbase  *weight) : From Syn_AMPA_SupPyr_SupFS
    
}

DERIVATIVE states {
    rates()
    g' = rate_g 
    A' = rate_A 
    
}

PROCEDURE rates() {
    
    i = -1 * g  * (  erev   - v) ? evaluable
    rate_A = -  A   /  tau ? Note units of all quantities used here need to be consistent!
    rate_g = (2.7182818284590451 *  A  -   g  )/  tau ? Note units of all quantities used here need to be consistent!
    
     
    
}

