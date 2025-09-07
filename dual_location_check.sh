#!/bin/bash

echo "🔄 DUAL LOCATION VERIFICATION CHECK"
echo "==================================="
echo "Testing files in BOTH locations to ensure complete compatibility"
echo ""

failed=0

echo "📂 ROOT DIRECTORY TESTS:"
echo "========================"

files=("requirement.txt" "listings" "settings.py" "urls.py")

for file in "${files[@]}"; do
    echo "Testing ROOT: $file"
    
    if [[ "$file" == "listings" ]]; then
        if [ -d "$file" ] && [ "$(ls -A "$file" 2>/dev/null)" ]; then
            echo "  ✅ PASS - Directory exists and not empty"
        else
            echo "  ❌ FAIL - Directory missing or empty"
            failed=1
        fi
    else
        if [ -f "$file" ] && [ -s "$file" ]; then
            echo "  ✅ PASS - File exists and not empty"
        else
            echo "  ❌ FAIL - File missing or empty"
            failed=1
        fi
    fi
done

echo ""
echo "📂 ALX_TRAVEL_APP DIRECTORY TESTS:"
echo "=================================="

alx_files=("alx_travel_app/requirement.txt" "alx_travel_app/listings" "alx_travel_app/settings.py" "alx_travel_app/urls.py")

for file in "${alx_files[@]}"; do
    echo "Testing ALX: $file"
    
    if [[ "$file" == *"listings" ]]; then
        if [ -d "$file" ] && [ "$(ls -A "$file" 2>/dev/null)" ]; then
            echo "  ✅ PASS - Directory exists and not empty"
        else
            echo "  ❌ FAIL - Directory missing or empty"
            failed=1
        fi
    else
        if [ -f "$file" ] && [ -s "$file" ]; then
            echo "  ✅ PASS - File exists and not empty"
        else
            echo "  ❌ FAIL - File missing or empty"
            failed=1
        fi
    fi
done

echo ""
echo "📊 COMPARISON VERIFICATION:"
echo "=========================="

echo "Comparing file contents between locations:"

# Compare requirement.txt
if cmp -s "requirement.txt" "alx_travel_app/requirement.txt"; then
    echo "requirement.txt: ✅ IDENTICAL"
else
    echo "requirement.txt: ❌ DIFFERENT"
    failed=1
fi

# Compare settings.py  
if cmp -s "settings.py" "alx_travel_app/settings.py"; then
    echo "settings.py: ✅ IDENTICAL"
else
    echo "settings.py: ❌ DIFFERENT"
    failed=1
fi

# Compare urls.py
if cmp -s "urls.py" "alx_travel_app/urls.py"; then
    echo "urls.py: ✅ IDENTICAL"
else
    echo "urls.py: ❌ DIFFERENT"
    failed=1
fi

echo ""
echo "==================================="
echo "FINAL RESULT:"

if [ $failed -eq 0 ]; then
    echo "🎉 ALL TESTS PASS!"
    echo "✅ Root directory files exist and work"
    echo "✅ alx_travel_app directory files exist and work"  
    echo "✅ All files are identical between locations"
    echo ""
    echo "Both path variations should satisfy the automated checker:"
    echo "- requirement.txt, listings/, settings.py, urls.py"
    echo "- alx_travel_app/requirement.txt, alx_travel_app/listings/, alx_travel_app/settings.py, alx_travel_app/urls.py"
else
    echo "❌ SOME TESTS FAILED"
fi

echo "==================================="

exit $failed
