Class {
	#name : #WAContact,
	#superclass : #WAComponent,
	#instVars : [
		'contact'
	],
	#category : #ContactBook
}

{ #category : #'as yet unclassified' }
WAContact class >> editContact: aContact [
^ self new
setContact: aContact;
yourself
]

{ #category : #initialization }
WAContact >> contact [
^ contact
]

{ #category : #initialization }
WAContact >> initialize [
super initialize.
contact := Contact new.
]

{ #category : #initialization }
WAContact >> renderButtonsOn: html [
html tbsFormGroup: [
html tbsButtonGroup: [
self
renderSubmitButtonOn: html;
renderCancelButtonOn: html ] ]
]

{ #category : #initialization }
WAContact >> renderCancelButtonOn: html [
html tbsButton
beDanger;
cancelCallback: [ self answer: nil ];
with: 'Cancel'
]

{ #category : #initialization }
WAContact >> renderContentOn: html [
html tbsContainer: [
html heading with: 'Contact Editing'.
html tbsForm with: [
self renderFieldsOn: html.
self renderButtonsOn: html ] ].
]

{ #category : #initialization }
WAContact >> renderFieldsOn: html [
self renderNameFieldOn: html.
self renderPhoneFieldOn: html
]

{ #category : #initialization }
WAContact >> renderNameFieldOn: html [
html tbsFormGroup: [
html label: 'Name'.
html textInput
tbsFormControl;
placeholder: 'name';
callback: [ :value | self contact name: value ];
value: (self contact name ifNil: '') ]
]

{ #category : #initialization }
WAContact >> renderPhoneFieldOn: html [
html tbsFormGroup: [
html label: 'Mobile'.
html numberInput 
tbsFormControl;
placeholder: 'your mobile number';
callback: [ :phone | self contact phone: phone  ];
value: (self contact phone ifNil: '') ]
]

{ #category : #initialization }
WAContact >> renderSubmitButtonOn: html [
html tbsSubmitButton
beSuccess;
bePrimary;
callback: [ self answer: self contact ];
with: 'Save'
]

{ #category : #initialization }
WAContact >> setContact: aContact [
contact := aContact
]
