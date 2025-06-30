{
    # Regex to match <<...>>
    while (match($0, /<<[^>]+>>/)) {
        # Extract matched string, e.g., <<foo>>
        matched_string = substr($0, RSTART, RLENGTH)

        # Extract content inside <<...>>
        inner = substr(matched_string, 3, length(matched_string) - 4)

        # Test against known cases
        switch (inner) {
        case "is a core file that uses lexical binding":
        case "copyright year":
        case "benevolent dictator for life":
        case "git host":
        case "spacemacs ghurl":
        case "copyright holders":
        case "copyright boilerplate":
        case "copyright":
            # Do nothing
            break
        default:
            print inner
            break
        }

        # Remove this match so next match can be found in same line
        $0 = substr($0, RSTART + RLENGTH)
    }
}
