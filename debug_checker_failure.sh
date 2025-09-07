#!/bin/bash

echo "🐛 COMPREHENSIVE AUTOMATED CHECKER FAILURE DEBUG"
echo "================================================"
echo "Repository: git@github.com:mfeti/alx_travel_app.git"
echo "Timestamp: $(date)"
echo "Working Directory: $(pwd)"
echo "User: $(whoami)"
echo "OS: $(uname -a)"
echo ""

echo "📋 GIT INFORMATION:"
echo "Latest commit: $(git rev-parse HEAD)"
echo "Branch: $(git branch --show-current)"
echo "Remote URL: $(git remote get-url origin)"
echo "Git status: $(git status --porcelain || echo 'No changes')"
echo ""

echo "📁 DIRECTORY STRUCTURE:"
echo "Repository root contents:"
ls -la
echo ""
echo "alx_travel_app directory contents:"
ls -la alx_travel_app/ 2>/dev/null || echo "Directory not found"
echo ""

echo "🔍 DETAILED FILE ANALYSIS:"
echo "========================================="

files=("alx_travel_app/requirement.txt" "alx_travel_app/listings" "alx_travel_app/settings.py" "alx_travel_app/urls.py")

for file_path in "${files[@]}"; do
    echo "Analyzing: $file_path"
    echo "  Absolute path: $(pwd)/$file_path"
    
    if [[ "$file_path" == *"listings" ]]; then
        # Directory checks
        echo "  Type: Directory"
        if [ -d "$file_path" ]; then
            echo "  ✅ Directory exists"
            echo "  Permissions: $(stat -c %A "$file_path" 2>/dev/null || echo 'N/A')"
            echo "  Owner: $(stat -c %U:%G "$file_path" 2>/dev/null || echo 'N/A')"
            
            file_count=$(ls -1 "$file_path" 2>/dev/null | wc -l)
            echo "  File count: $file_count"
            
            if [ "$file_count" -gt 0 ]; then
                echo "  ✅ Directory not empty"
                echo "  Contents: $(ls "$file_path" | tr '\n' ' ')"
            else
                echo "  ❌ Directory is empty"
            fi
        else
            echo "  ❌ Directory does not exist"
        fi
    else
        # File checks
        echo "  Type: File"
        if [ -f "$file_path" ]; then
            echo "  ✅ File exists"
            echo "  Permissions: $(stat -c %A "$file_path" 2>/dev/null || echo 'N/A')"
            echo "  Owner: $(stat -c %U:%G "$file_path" 2>/dev/null || echo 'N/A')"
            
            file_size=$(wc -c < "$file_path" 2>/dev/null || echo '0')
            echo "  Size: $file_size bytes"
            
            if [ "$file_size" -gt 0 ]; then
                echo "  ✅ File not empty"
                echo "  First 100 chars: $(head -c 100 "$file_path" 2>/dev/null | tr '\n' ' ')"
            else
                echo "  ❌ File is empty"
            fi
        else
            echo "  ❌ File does not exist"
        fi
    fi
    
    echo "  --------------------------------"
done

echo ""
echo "🔧 AUTOMATED CHECKER SIMULATION:"
echo "========================================="

failed=0

for file_path in "${files[@]}"; do
    echo "TEST: $file_path"
    
    if [[ "$file_path" == *"listings" ]]; then
        if [ -d "$file_path" ] && [ "$(ls -A "$file_path" 2>/dev/null)" ]; then
            echo "✅ PASS"
        else
            echo "❌ FAIL"
            failed=1
        fi
    else
        if [ -f "$file_path" ] && [ -s "$file_path" ]; then
            echo "✅ PASS"  
        else
            echo "❌ FAIL"
            failed=1
        fi
    fi
done

echo ""
echo "========================================="
echo "SUMMARY:"
if [ $failed -eq 0 ]; then
    echo "🎉 ALL TESTS PASS - No issues found locally"
    echo "The automated checker failure is likely due to external factors."
else
    echo "❌ SOME TESTS FAIL - Issues found"
fi

echo ""
echo "REPOSITORY INTEGRITY CHECK:"
echo "Git objects: $(git count-objects 2>/dev/null || echo 'Error')"
echo "Remote connectivity: $(git ls-remote origin HEAD 2>/dev/null && echo 'OK' || echo 'ERROR')"

echo ""
echo "DEBUG COMPLETE"
echo "================================================"

exit $failed
