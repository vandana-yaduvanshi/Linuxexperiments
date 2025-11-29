#!/bin/bash
echo "Welcome to the Advanced Medical Expert System"
echo "Enter your symptoms separated by commas:"
read symptoms

# Convert to lowercase and array
symptoms_lower=$(echo "$symptoms" | tr '[:upper:]' '[:lower:]' | tr ',' ' ')
declare -A recommendations
declare -a matched_symptoms

# Define symptom-recommendation rules
recommendations["fever"]="Take fever reducer medication|Monitor temperature every 4 hours|Stay hydrated"
recommendations["sore_throat"]="Gargle with warm saltwater|Use throat lozenges|Avoid cold drinks"
recommendations["cough"]="Drink warm fluids with honey|Use cough syrup|Use humidifier"
recommendations["headache"]="Rest in dark room|Apply cold compress|Consider pain relief"
recommendations["cold"]="Get plenty of rest|Use saline nasal spray|Take vitamin C"
recommendations["stomach_pain"]="Avoid solid foods|Drink clear fluids|Apply warm compress"
recommendations["fatigue"]="Ensure 7-8 hours sleep|Eat iron-rich foods|Light exercise"
recommendations["nausea"]="Drink ginger tea|Eat small frequent meals|Avoid strong smells"

echo ""
echo "=== MEDICAL ADVICE REPORT ==="
echo "Input Symptoms: $symptoms"
echo ""

# Check each symptom and collect matches
for symptom in "${!recommendations[@]}"; do
    if [[ " $symptoms_lower " == *" $symptom "* ]]; then
        matched_symptoms+=("$symptom")
    fi
done

# Display recommendations for matched symptoms
if [ ${#matched_symptoms[@]} -gt 0 ]; then
    echo "RECOMMENDATIONS:"
    echo "----------------"
    for symptom in "${matched_symptoms[@]}"; do
        echo "● For $symptom:" # added ascii character for bulled
        IFS='|' read -ra advice <<< "${recommendations[$symptom]}"
        for item in "${advice[@]}"; do
            echo "  - $item"
        done
        echo ""
    done
else
    echo "No specific symptoms recognized."
    echo "General Advice: Consult a healthcare professional."
fi

# Additional general advice
echo "GENERAL PRECAUTIONS:"
echo "-------------------"
echo " Wash hands frequently"
echo " Maintain social distance if infectious"
echo " Get adequate rest and nutrition"
echo " Seek emergency care for severe symptoms like:"
echo "  - Difficulty breathing"
echo "  - Chest pain" 
echo "  - High fever (over 103°F)"
echo "  - Severe dehydration"

