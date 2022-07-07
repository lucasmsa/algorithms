# O(n) Time | O(1) Space
def identify_titles(scores):
    decreasing_monotonic, increasing_monotonic = False, False

    for index in range(1, len(scores)):
        if scores[index] > scores[index - 1]:
            if decreasing_monotonic:
                return False
            else:
                increasing_monotonic = True
        elif scores[index] < scores[index - 1]:
            if increasing_monotonic:
                return False
            else:
                decreasing_monotonic = True

    return True


print(identify_titles([8, 8, 7, 6, 5, 4, 4, 1]))
