'use strict';

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Steps = function () {
  function Steps(wizard) {
    _classCallCheck(this, Steps);

    this.wizard = wizard;
    this.steps = this.getSteps();
    this.stepsQuantity = this.getStepsQuantity();
    this.currentStep = 0;
  }

  Steps.prototype.setCurrentStep = function setCurrentStep(currentStep) {
    this.currentStep = currentStep;
  };

  Steps.prototype.getSteps = function getSteps() {
    return this.wizard.getElementsByClassName('step');
  };

  Steps.prototype.getStepsQuantity = function getStepsQuantity() {
    return this.getSteps().length;
  };

  Steps.prototype.handleConcludeStep = function handleConcludeStep() {
    this.steps[this.currentStep].classList.add('-completed');
  };

  Steps.prototype.handleStepsClasses = function handleStepsClasses(movement) {
    if (movement > 0) this.steps[this.currentStep - 1].classList.add('-completed');else if (movement < 0) this.steps[this.currentStep].classList.remove('-completed');
  };

  return Steps;
}();

var Panels = function () {
  function Panels(wizard) {
    _classCallCheck(this, Panels);

    this.wizard = wizard;
    this.panelWidth = this.wizard.offsetWidth;
    this.panelsContainer = this.getPanelsContainer();
    this.panels = this.getPanels();
    this.currentStep = 0;

    this.updatePanelsPosition(this.currentStep);
    this.updatePanelsContainerHeight();
  }

  Panels.prototype.getCurrentPanelHeight = function getCurrentPanelHeight() {
    return this.getPanels()[this.currentStep].offsetHeight + 'px';
  };

  Panels.prototype.getPanelsContainer = function getPanelsContainer() {
    return this.wizard.querySelector('.panels');
  };

  Panels.prototype.getPanels = function getPanels() {
    return this.wizard.getElementsByClassName('panel');
  };

  Panels.prototype.updatePanelsContainerHeight = function updatePanelsContainerHeight() {
    this.panelsContainer.style.height = this.getCurrentPanelHeight();
  };

  Panels.prototype.updatePanelsPosition = function updatePanelsPosition(currentStep) {
    var panels = this.panels;
    var panelWidth = this.panelWidth;

    for (var i = 0; i < panels.length; i++) {
      panels[i].classList.remove('movingIn', 'movingOutBackward', 'movingOutFoward');

      if (i !== currentStep) {
        if (i < currentStep) panels[i].classList.add('movingOutBackward');else if (i > currentStep) panels[i].classList.add('movingOutFoward');
      } else {
        panels[i].classList.add('movingIn');
      }
    }

    this.updatePanelsContainerHeight();
  };

  Panels.prototype.setCurrentStep = function setCurrentStep(currentStep) {
    this.currentStep = currentStep;
    this.updatePanelsPosition(currentStep);
  };

  return Panels;
}();

var Wizard = function () {
  function Wizard(obj) {
    _classCallCheck(this, Wizard);

    this.wizard = obj;
    this.panels = new Panels(this.wizard);
    this.steps = new Steps(this.wizard);
    this.stepsQuantity = this.steps.getStepsQuantity();
    this.currentStep = this.steps.currentStep;

    this.concludeControlMoveStepMethod = this.steps.handleConcludeStep.bind(this.steps);
    this.wizardConclusionMethod = this.handleWizardConclusion.bind(this);
  }

  Wizard.prototype.updateButtonsStatus = function updateButtonsStatus() {
    if (this.currentStep === 0) this.previousControl.classList.add('disabled');else this.previousControl.classList.remove('disabled');
  };

  Wizard.prototype.updtadeCurrentStep = function updtadeCurrentStep(movement) {
    this.currentStep += movement;
    this.steps.setCurrentStep(this.currentStep);
    this.panels.setCurrentStep(this.currentStep);

    this.handleNextStepButton();
    this.updateButtonsStatus();
  };

  Wizard.prototype.handleNextStepButton = function handleNextStepButton() {
    if (this.currentStep === this.stepsQuantity - 1) {
      this.nextControl.innerHTML = 'Conclude!';

      this.nextControl.removeEventListener('click', this.nextControlMoveStepMethod);
      this.nextControl.addEventListener('click', this.concludeControlMoveStepMethod);
      this.nextControl.addEventListener('click', this.wizardConclusionMethod);
    } else {
      this.nextControl.innerHTML = 'Next';

      this.nextControl.addEventListener('click', this.nextControlMoveStepMethod);
      this.nextControl.removeEventListener('click', this.concludeControlMoveStepMethod);
      this.nextControl.removeEventListener('click', this.wizardConclusionMethod);
    }
  };

  Wizard.prototype.handleWizardConclusion = function handleWizardConclusion() {
    this.wizard.classList.add('completed');
  };

  Wizard.prototype.addControls = function addControls(previousControl, nextControl) {
    this.previousControl = previousControl;
    this.nextControl = nextControl;
    this.previousControlMoveStepMethod = this.moveStep.bind(this, -1);
    this.nextControlMoveStepMethod = this.moveStep.bind(this, 1);

    previousControl.addEventListener('click', this.previousControlMoveStepMethod);
    nextControl.addEventListener('click', this.nextControlMoveStepMethod);

    this.updateButtonsStatus();
  };

  Wizard.prototype.moveStep = function moveStep(movement) {
    if (this.validateMovement(movement)) {
      this.updtadeCurrentStep(movement);
      this.steps.handleStepsClasses(movement);
    } else {
      throw 'This was an invalid movement';
    }
  };

  Wizard.prototype.validateMovement = function validateMovement(movement) {
    var fowardMov = movement > 0 && this.currentStep < this.stepsQuantity - 1;
    var backMov = movement < 0 && this.currentStep > 0;

    return fowardMov || backMov;
  };

  return Wizard;
}();

var wizardElement = document.getElementById('wizard');
var wizard = new Wizard(wizardElement);
var buttonNext = document.querySelector('.next');
var buttonPrevious = document.querySelector('.previous');

wizard.addControls(buttonPrevious, buttonNext);