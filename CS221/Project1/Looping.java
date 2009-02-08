ARRAY = [6, 18, -3, 58, 201, 44, 83, -175, -42, 8, 0]
N = array.length
EVEN = 0
ODD = 0

t0 = 0
s0 = N
t1 = 4
s1 = 0 # (EVEN)
s2 = 0 # (ODD)

while(t0 < s0) {
  # We shift the byte out of addressing space and then pad it with 0s to get
  # the last bit of the byte, because we don't have a load_bit tool
  t2 = load_byte(array[t1])
  shift_left(t2, 31)
  shift_right(t2, 31)
  
  if t2 == 0 # even
    s1++
  else # odd
    s2++
  end
  
  t0++
  t1 = t1 + 4
}

EVEN = s1
ODD = s2