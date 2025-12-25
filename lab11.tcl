restart

add_force R0 {0 0ns}
add_force R5 {0 0ns}
add_force CKA {0 0ns}
add_force RESET {0 0ns}
run 50ns

add_force RESET {1 0ns}
run 50ns

add_force CKA {0 0ns}
run 50ns

add_force CKA {1 0ns}
run 50ns

add_force CKA {0 0ns}
run 50ns

add_force CKA {1 0ns}
run 50ns

add_force CKA {0 0ns}
run 50ns

add_force CKA {1 0ns}
run 50ns

add_force CKA {0 0ns}
run 50ns

add_force CKA {1 0ns}
run 50ns

add_force CKA {0 0ns}
run 50ns

add_force CKA {1 0ns}
run 50ns

add_force CKA {0 0ns}
run 50ns

add_force CKA {1 0ns}
run 50ns

add_force CKA {0 0ns}
run 50ns

add_force CKA {1 0ns}
run 50ns

add_force CKA {0 0ns}
run 50ns

add_force R0 {1 0ns}
run 50ns

add_force R5 {1 0ns}
run 50ns
