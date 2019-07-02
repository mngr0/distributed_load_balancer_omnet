//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

#include <omnetpp.h>

#include "RouterD.h"
#include "PassiveQueue.h"

Define_Module(RouterD);

void RouterD::initialize()
{
    // TODO - Generated method body
    //Router::initialize();

}

void RouterD::handleMessage(cMessage *msg)
{

    //Router::handleMessage(msg);
    // TODO - Generated method body
    int outGateIndex = -1;  // by default we drop the message

    cModule *moduleMain = gate("out",0)->getNextGate()->getOwnerModule();
    int lenghtMain = (dynamic_cast<queueing::PassiveQueue *>(moduleMain))->length();

    outGateIndex=0;

    cModule *moduleSecondary = gate("out",1)->getNextGate()->getOwnerModule();
    int lenghtSecondary = (dynamic_cast<queueing::PassiveQueue *>(moduleSecondary))->length();

    if (lenghtMain-lenghtSecondary >= par("delta").intValue() ) {
        outGateIndex=1;
    }
    if (outGateIndex < 0 || outGateIndex >= gateSize("out"))
        throw cRuntimeError("Invalid output gate selected during routing");
    send(msg, "out", outGateIndex);
}
