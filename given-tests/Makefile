#
# Josh Hursey
#
# Given set of correctness tests
# Note: There will be more added when assessing your final grade.
#       These tests are -not- comprehensive!
#

#
# Tests
#
check: mysh banner_help check-part2


banner_help:
	@echo ""
	@echo "mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm"
	@echo "This is going to run a variety of tests against your program."
	@echo "These tests are not comprehensive, and not validated."
	@echo "You will need to manually inspect the output to make sure that it is correct"
	@echo ""
	@echo "You can just run the batch versions by using:"
	@echo "   check-batch"
	@echo ""
	@echo "You can just run the interactive versions by using:"
	@echo "   check-interactive"
	@echo "mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm"
	@echo ""
	@sleep 1


###############################################
# Tests - Part 2
###############################################
check-part2: check-batch check-interactive

check-batch: mysh \
	part2-level01 part2-level02 part2-level03 part2-level04 part2-level05 \
	part2-level06 part2-level07 part2-level08 part2-level09 part2-level10 \
	part2-level11 part2-level12 part2-level13

check-interactive: mysh \
	part2-level01-I part2-level02-I part2-level03-I part2-level04-I part2-level05-I \
	part2-level06-I part2-level07-I part2-level08-I part2-level09-I part2-level10-I \
	part2-level11-I part2-level12-I part2-level13-I

############# Levels
T_P2_I_LEVEL1=given-tests/level01.txt
part2-level01:
	@given-tests/check.pl B "./mysh" $(T_P2_I_LEVEL1) 6 6 0

part2-level01-I:
	@given-tests/check.pl I "./mysh" $(T_P2_I_LEVEL1) 6 6 0


T_P2_I_LEVEL2=given-tests/level02.txt
part2-level02:
	@given-tests/check.pl B "./mysh" $(T_P2_I_LEVEL2) 7 14 4

part2-level02-I:
	@given-tests/check.pl I "./mysh" $(T_P2_I_LEVEL2) 7 14 4


T_P2_I_LEVEL3=given-tests/level03.txt
part2-level03:
	@given-tests/check.pl B "./mysh" $(T_P2_I_LEVEL3) 9 14 4

part2-level03-I:
	@given-tests/check.pl I "./mysh" $(T_P2_I_LEVEL3) 9 14 4


T_P2_I_LEVEL4=given-tests/level04.txt
part2-level04:
	@given-tests/check.pl B "./mysh" $(T_P2_I_LEVEL4) 5 5 0

part2-level04-I:
	@given-tests/check.pl I "./mysh" $(T_P2_I_LEVEL4) 5 5 0


T_P2_I_LEVEL5=given-tests/level05.txt
part2-level05:
	@given-tests/check.pl B "./mysh" $(T_P2_I_LEVEL5) 31 31 0

part2-level05-I:
	@given-tests/check.pl I "./mysh" $(T_P2_I_LEVEL5) 31 31 0


T_P2_I_LEVEL6=given-tests/level06.txt
part2-level06:
	@given-tests/check.pl B "./mysh" $(T_P2_I_LEVEL6) 33 35 25

part2-level06-I:
	@given-tests/check.pl I "./mysh" $(T_P2_I_LEVEL6) 33 35 25


T_P2_I_LEVEL7=given-tests/level07.txt
part2-level07:
	@given-tests/check.pl B "./mysh" $(T_P2_I_LEVEL7) 5 7 5

part2-level07-I:
	@given-tests/check.pl I "./mysh" $(T_P2_I_LEVEL7) 5 7 5


T_P2_I_LEVEL8=given-tests/level08.txt
part2-level08:
	@given-tests/check.pl B "./mysh" $(T_P2_I_LEVEL8) 11 14 7

part2-level08-I:
	@given-tests/check.pl I "./mysh" $(T_P2_I_LEVEL8) 11 14 7


T_P2_I_LEVEL9=given-tests/level09.txt
part2-level09:
	@given-tests/check.pl B "./mysh" $(T_P2_I_LEVEL9) 100 100 0

part2-level09-I:
	@given-tests/check.pl I "./mysh" $(T_P2_I_LEVEL9) 100 100 0


T_P2_I_LEVEL10=given-tests/level10.txt
part2-level10:
	@given-tests/check.pl B "./mysh" $(T_P2_I_LEVEL10) 100 100 100

part2-level10-I:
	@given-tests/check.pl I "./mysh" $(T_P2_I_LEVEL10) 100 100 100


T_P2_I_LEVEL11=given-tests/level11.txt
part2-level11:
	@given-tests/check.pl B "./mysh" $(T_P2_I_LEVEL11) 1 1 0

part2-level11-I:
	@given-tests/check.pl I "./mysh" $(T_P2_I_LEVEL11) 1 1 0


T_P2_I_LEVEL12=given-tests/level12.txt
part2-level12:
	@given-tests/check.pl B "./mysh" $(T_P2_I_LEVEL12) 1000 1000 0

part2-level12-I:
	@given-tests/check.pl I "./mysh" $(T_P2_I_LEVEL12) 1000 1000 0


T_P2_I_LEVEL13=given-tests/level13.txt
part2-level13:
	@given-tests/check.pl B "./mysh" $(T_P2_I_LEVEL13) 10 10 0

part2-level13-I:
	@given-tests/check.pl I "./mysh" $(T_P2_I_LEVEL13) 10 10 0
