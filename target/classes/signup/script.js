// Select all steps in the progress bar
const steps = document.querySelectorAll(".progress-bar .step");

// Select all form steps (div elements containing each form section)
const formSteps = document.querySelectorAll(".form-step");

// Track the current active step
let currentStep = 0;

// Function to update the active step
function updateStep(stepIndex) {
    // Update the form steps
    formSteps.forEach((step, index) => {
        if (index === stepIndex) {
            step.classList.add("active");
        } else {
            step.classList.remove("active");
        }
    });

    // Update the progress bar steps
    steps.forEach((step, index) => {
        if (index <= stepIndex) {
            step.classList.add("active");
        } else {
            step.classList.remove("active");
        }
    });
}

// Event listener for "Next" buttons
document.querySelectorAll(".next-btn").forEach((btn) => {
    btn.addEventListener("click", () => {
        if (currentStep < steps.length - 1) {
            currentStep++;
            updateStep(currentStep);
        }
    });
});

// Event listener for "Back" buttons
document.querySelectorAll(".prev-btn").forEach((btn) => {
    btn.addEventListener("click", () => {
        if (currentStep > 0) {
            currentStep--;
            updateStep(currentStep);
        }
    });
});

// Form submit event listener
document.getElementById("signup-form").addEventListener("submit", (e) => {
    e.preventDefault(); // Prevent default form submission for testing
    alert("Sign-up successful!"); // Temporary success alert
});
