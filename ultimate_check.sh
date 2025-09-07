#!/bin/bash

echo "🤖 ULTIMATE AUTOMATED CHECKER SIMULATION"
echo "========================================"
echo "Simulating EXACT automated checker behavior"
echo "Repository: git@github.com:mfeti/alx_travel_app.git"
echo "Commit: $(git rev-parse HEAD)"
echo ""

# Exact tests from error message
failed=0

echo "❓ Check if GitHub repo exists"
if [ -d ".git" ]; then
    echo "✅ PASS"
else
    echo "❌ FAIL"
    failed=1
fi

echo "❓ Check if alx_travel_app/requirement.txt file exists and not empty"
if [ -f "alx_travel_app/requirement.txt" ] && [ -s "alx_travel_app/requirement.txt" ]; then
    echo "✅ PASS"
else
    echo "❌ FAIL"
    failed=1
    echo "  Debug: file exists? $(test -f alx_travel_app/requirement.txt && echo YES || echo NO)"
    echo "  Debug: file size: $(wc -c < alx_travel_app/requirement.txt 2>/dev/null || echo ERROR)"
fi

echo "❓ Check if alx_travel_app/listings exists and not empty"
if [ -d "alx_travel_app/listings" ] && [ "$(ls -A alx_travel_app/listings 2>/dev/null)" ]; then
    echo "✅ PASS"
else
    echo "❌ FAIL"
    failed=1
    echo "  Debug: dir exists? $(test -d alx_travel_app/listings && echo YES || echo NO)"
    echo "  Debug: dir files: $(ls -1 alx_travel_app/listings 2>/dev/null | wc -l || echo ERROR)"
fi

echo "❓ Check if alx_travel_app/settings.py file exists and not empty"
if [ -f "alx_travel_app/settings.py" ] && [ -s "alx_travel_app/settings.py" ]; then
    echo "✅ PASS"
else
    echo "❌ FAIL"
    failed=1
    echo "  Debug: file exists? $(test -f alx_travel_app/settings.py && echo YES || echo NO)"
    echo "  Debug: file size: $(wc -c < alx_travel_app/settings.py 2>/dev/null || echo ERROR)"
fi

echo "❓ Check if alx_travel_app/urls.py file exists and not empty"
if [ -f "alx_travel_app/urls.py" ] && [ -s "alx_travel_app/urls.py" ]; then
    echo "✅ PASS"
else
    echo "❌ FAIL"  
    failed=1
    echo "  Debug: file exists? $(test -f alx_travel_app/urls.py && echo YES || echo NO)"
    echo "  Debug: file size: $(wc -c < alx_travel_app/urls.py 2>/dev/null || echo ERROR)"
fi

echo ""
echo "========================================"
if [ $failed -eq 0 ]; then
    echo "🎉 ALL CHECKS PASS - EXACTLY LIKE AUTOMATED CHECKER"
else
    echo "❌ SOME CHECKS FAILED"
    echo ""
    echo "Repository structure:"
    find . -name "*.txt" -o -name "*.py" -o -type d | head -20
fi
echo "========================================"

exit $failed
