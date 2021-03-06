// Copyright 2018-present the Material Components for iOS authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "MaterialTextFields+ColorThemer.h"
#import "MaterialTextFields+TypographyThemer.h"
#import "MaterialTextFields.h"
#import "supplemental/MDCAbstractTextFieldSnapshotTests+I18N.h"
#import "supplemental/MDCAbstractTextFieldSnapshotTests.h"
#import "supplemental/SnapshotFakeMDCMultilineTextField.h"

@interface MDCTextAreaOutlinedControllerBaselineCharacterCountArabicSnapshotTests
    : MDCAbstractTextFieldSnapshotTests <MDCTextFieldSnapshotTestCaseHooking>
@end

@implementation MDCTextAreaOutlinedControllerBaselineCharacterCountArabicSnapshotTests

- (void)setUp {
  [super setUp];

  // Empty tests are executed in MDCTextAreaOutlinedControllerBaselineCharacterCountSnapshotTests
  self.shouldExecuteEmptyTests = NO;

  // Uncomment below to recreate the golden images for all test methods. Add it to a test method to
  // update only that golden image.
  //  self.recordMode = YES;

  self.textField = [[SnapshotFakeMDCMultilineTextField alloc] init];
  self.textField.clearButtonMode = UITextFieldViewModeAlways;

  self.textFieldController =
      [[MDCTextInputControllerOutlinedTextArea alloc] initWithTextInput:self.textField];
  self.textFieldController.characterCountMax = 50;
  self.textFieldController.characterCountViewMode = UITextFieldViewModeAlways;
  MDCSemanticColorScheme *colorScheme =
      [[MDCSemanticColorScheme alloc] initWithDefaults:MDCColorSchemeDefaultsMaterial201804];
  MDCTypographyScheme *typographyScheme =
      [[MDCTypographyScheme alloc] initWithDefaults:MDCTypographySchemeDefaultsMaterial201804];

  [MDCOutlinedTextFieldColorThemer applySemanticColorScheme:colorScheme
                                      toTextInputController:self.textFieldController];
  [MDCTextFieldTypographyThemer applyTypographyScheme:typographyScheme
                                toTextInputController:self.textFieldController];
  [MDCTextFieldTypographyThemer applyTypographyScheme:typographyScheme toTextInput:self.textField];

  [self changeStringsToArabic];
}

- (void)willGenerateSnapshotAndVerify {
  [self changeLayoutToRTL];
}

// NOTE: Additional test methods can be found in MDCAbstractTextFieldSnapshotTests.m

@end
