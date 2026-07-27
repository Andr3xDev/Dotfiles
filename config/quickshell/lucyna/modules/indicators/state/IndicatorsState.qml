pragma Singleton

import QtQuick

/*!
    IndicatorsState — shared state placeholder for the indicators/ module family.

    Currently empty: only one indicator exists (Volume.qml), so there is nothing
    to coordinate yet. Add properties here ONLY when a second indicator is built
    (e.g. a Battery or Brightness OSD) and needs to coordinate with Volume.qml —
    for example, suppressing overlapping OSD popups, or sharing a common OSD
    auto-hide timeout across indicator types. Do not add speculative properties
    before a second indicator actually exists.
*/
QtObject {
    id: root
}
