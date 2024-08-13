def is_user_id_valid(user_id, min_id=1, max_id=10):
    """Check if user_id is within the specified range."""
    return min_id <= user_id <= max_id

def is_title_length_valid(title, min_length=5, max_length=100):
    """Check if the length of the title is within the specified range."""
    return min_length <= len(title) <= max_length

def custom_check(value):
    if value < 100:
        return True
    return False
