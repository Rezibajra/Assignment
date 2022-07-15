from utils import get_sorted_list

"""
    1. Sort the dictionary by its keys. Using traditional sorting.
"""
def get_sorted_dict(chest):

    keys_list = get_sorted_list(chest.keys())
    sorted_dict = {str(i): chest[str(i)] for i in keys_list}
    return sorted_dict


"""
    2. Get the values of first, second, last and second last keys.
"""
def get_chest_values(chest):

    chest_values = list(chest.values())
    first = chest_values[0]
    second = chest_values[1]
    second_last = chest_values[-2]
    last = chest_values[-1]
    return first, second, second_last, last


"""
    3. Concatenate the values of obtained keys in a string.
"""
def concatenate_values(first, second, second_last, last):

    concatenated_string = first + ' ' + second + ' ' + second_last + ' ' + last
    return concatenated_string


"""
    4. Get first and last characters of each word in concatenated string, no spaces in between.
"""
def get_first_last_char(concatenated_string):

    result_string = ''
    string_list = concatenated_string.split(' ')

    for x in string_list:
        result_string = result_string + (x[0] + x[-1])
    return result_string


"""
   5. Get the number of occurrences of each letter in the resulting string and get top 5 letters
   without using any python package. The uppercase character should be counted in the lower
   case. Eg: ‘A’ character should result in an increment of key ‘a.’.
"""
def get_top_character_dict(result_string):

    char_dict = {}
    sorted_char_dict = {}

    # Create a dictionary of number of occurrences of each letter in the resulting string.
    for ch in result_string:
        lower_ch = ch.lower()
        if lower_ch in char_dict:
            char_dict[lower_ch] += 1
        else:
            char_dict[lower_ch] = 1

    # Get the sorted list of dictionary values in ascending order.
    asc_value_list = get_sorted_list(char_dict.values())

    # Get the sorted list of dictionary values in descending order.
    desc_value_list = asc_value_list[::-1]
    
    # Create a dictionary with higher occurances followed by lower occurances.
    for val in desc_value_list:
        for key, value in char_dict.items():
            if val == value:
                sorted_char_dict[key] = val

    # Get dictionary with top 5 letters.
    top_char_dict = dict(list(sorted_char_dict.items())[:5])
    return char_dict, top_char_dict


"""
    6. On the chest infront of you, there is a list of numbers.
"""
key_list = [52,51,61,71,56]


"""
    7. Sum the number_of_occurrences of the resulting dictionary with values of the key_list you
    found in the chest.
"""
def sum_of_occurances(resulting_dict):

    resulting_list = list(resulting_dict.values())
    sum_list = [resulting_list[x] + key_list[x] for x in range(len(resulting_list))]
    return sum_list


"""
    8. Then, get the ascii character of those 5 summed values and you shall get the treasure.
"""
def get_ascii_character(sum_list):

    ascii_list = [chr(n) for n in sum_list]
    return ascii_list


#Print all the results
chest = {
'42': 'It is the Answer to Life the Universe and Everything.',
'666': 'If you would be a real seeker after truth, it is necessary that at least once in your life you doubt, as far as possible, all things.',
'8': 'It is wrong always, everywhere and for everyone, to believe anything upon insufficient evidence.',
'13': 'The Truth is in the Heart.',
'0': 'Freedom is secured not by the fulfilling of ones desires, but by the removal of desire.',
'9': 'The unexamined life is not worth living.',
'76': 'Life is a series of natural and spontaneous changes.',
'70': 'God is dead! He remains dead! And we have killed him.'
}

sorted_dict = get_sorted_dict(chest)
print("---Question 1---", sorted_dict)

first, second, second_last, last = get_chest_values(sorted_dict)
print("---Question 2---", first, second, second_last, last)

concatenated_string = concatenate_values(first, second, second_last, last)
print("---Question 3---", concatenated_string)

result_string = get_first_last_char(concatenated_string)
print("---Question 4---", result_string)

char_dict, top_char_dict = get_top_character_dict(result_string)
print("---Question 5---", char_dict)
print("---Question 5---", top_char_dict)

print("---Question 6---", key_list)

sum_list = sum_of_occurances(top_char_dict)
print("---Question 7---", sum_list)

ascii_list = get_ascii_character(sum_list)
print("---Question 8---", ascii_list)