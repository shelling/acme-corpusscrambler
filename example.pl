#!/usr/bin/env perl

use 5.010;

use utf8;
use warnings;
use strict;

use lib 'lib';
use Acme::CorpusScrambler;

my $g = Acme::CorpusScrambler->new;
my $text = <<photonic;
響,可以獲得耦合波導中電磁波傳輸模態的有用 
近似。從緊密束縛理論可以推導出兩獨立波導最鄰近缺陷的耦合係數(α)造成 
兩個散射模態的分離,而第二鄰近缺陷的耦合係數(β)造成弦波形式的調變。如 
果|2β /α|>1，兩個模態的色散曲線將有機會交會；在交會處,耦合長度會為 
無限長，且在通過交會點色散曲線的模態會交換。如果將兩個波導距離加大, 
則耦合係數會變小,造成兩條色散曲線的頻率差變小，進而使耦合長度加長； 
在此一過程當中,使得第三鄰近的耦合係數(γ)數量級和α,β相當，可能造成色 
散曲線不只會相交於一點。倘若如此，是否每次交點後模態都會交換？色散曲 
線相交之後的電場分佈是否還能用緊密束縛理論來分析？這些都是非常值得探 
討的問題。因為對於這些問題的瞭解，可以讓我們更清楚地瞭解光子晶體波導 
的耦合現象，進而利用這些現象來做一些光子晶體元件
photonic

$g->feed( photonic => $text );
say $g->scramble("photonic");

