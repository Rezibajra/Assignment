"""
    Function that returns a sorted list of dictionary keys 
    or values based on the arguments passed.
"""
def get_sorted_list(k_v):
    
    keys_list = [int(k) for k in k_v]
    for x in range(0, len(keys_list)):
        for y in range(x+1, len(keys_list)):
            if keys_list[x] > keys_list[y]:
                keys_list[x], keys_list[y] = keys_list[y], keys_list[x]

    return keys_list