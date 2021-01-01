"
Description
--------------------

I am an action to open a web browser on the localhost defined by the adaptor depending on its port.
"
Class {
	#name : #WAOpenBrowserCommand,
	#superclass : #WAControlPanelCommand,
	#category : #'Seaside-Pharo-Tools-Spec2'
}

{ #category : #converting }
WAOpenBrowserCommand >> asSpecCommand [
	^ super asSpecCommand
		iconName: #window;
		yourself
]

{ #category : #hooks }
WAOpenBrowserCommand >> execute [
	self adaptor
		ifNotNil: [ :adaptor | 
			adaptor isRunning ifFalse: [ ^ self ].
			WebBrowser openOn: 'http://localhost:' , adaptor port asString ]
]

{ #category : #initialization }
WAOpenBrowserCommand >> initialize [
	super initialize.
	self
		name: 'Open';
		description: 'Opoen localhost on the port of the adaptor.'
]