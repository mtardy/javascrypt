#!/bin/bash
PROG=calc

make

echo "2+3" | ./${PROG} | cmp <(echo "5") && echo "test#1 passed!" || true
echo "2-3" | ./${PROG} | cmp <(echo "-1") && echo "test#2 passed!" || true
echo "2--3" | ./${PROG} | cmp <(echo "5") && echo "test#3 passed!" || true
echo "-2+3" | ./${PROG} | cmp <(echo "1") && echo "test#4 passed!" || true
echo "+2+3" | ./${PROG} | cmp <(echo "5") && echo "test#5 passed!" || true
echo "2*3" | ./${PROG} | cmp <(echo "6") && echo "test#6 passed!" || true
echo "4/2" | ./${PROG} | cmp <(echo "2") && echo "test#7 passed!" || true
echo "3/2" | ./${PROG} | cmp <(echo "1") && echo "test#8 passed!" || true
echo "5%2" | ./${PROG} | cmp <(echo "1") && echo "test#9 passed!" || true
echo "3*2+10*2" | ./${PROG} | cmp <(echo "26") && echo "test#10 passed!" || true
echo "-3*2+10*2" | ./${PROG} | cmp <(echo "14") && echo "test#11 passed!" || true
echo "- 5%  2 +2-6 / 2" | ./${PROG} | cmp <(echo "-2") && echo "test#12 passed!" || true
echo "a=3" | ./${PROG} | cmp <(echo "a=3") && echo "test#13 passed!" || true
echo "a=3 a*2" | ./${PROG} | cmp <(printf "a=3\n6\n") && echo "test#14 passed!" || true
echo "a=10 z=13 a+z" | ./${PROG} | cmp <(printf "a=10\nz=13\n23\n") && echo "test#15 passed!" || true
echo "tamales=10 tomato=2 tamales*tomato" | ./${PROG} | cmp <(printf "tamales=10\ntomato=2\n20\n") && echo "test#16 passed!" || true