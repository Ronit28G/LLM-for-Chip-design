def comparator4bit_golden(A, B):
    # Ensure A and B are within 4-bit range
    if not (0 <= A < 16) or not (0 <= B < 16):
        raise ValueError("Inputs must be 4-bit unsigned integers (0-15).")
    
    # Initialize output signals
    outputs = {'greater': 0, 'equal': 0, 'less': 0}
    
    # Compare A and B
    if A > B:
        outputs['greater'] = 1
    elif A == B:
        outputs['equal'] = 1
    else:
        outputs['less'] = 1
    
    return outputs